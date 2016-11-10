require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class SubscribeTeamsController < ApplicationController
      before_action :set_project

      def new_required
        @required = current_candidate.subscribe_requireds.new
      end

      def create_required
        @required = current_candidate.subscribe_requireds.new(set_params_required)
        
        respond_to do |format|
          if @required.save && ::Subscribe.allow_project?
            format.html {
              flash[:green] = "Operação realizada com sucesso!"
              redirect_to project_candidate_area_participations_path(@project)
            }

            format.js {
              flash[:green] = "Operação realizada com sucesso!"
              render js: "window.location.href = '#{project_candidate_area_participations_path(@project)}'"
            } 

          else 

            format.html {
              flash[:red] = "Arquivo de formato inválido ou excede o tamanho máximo. Verifique."
              redirect_to new_project_candidate_area_participation_path @project  
            }

           
          end
        end
      end

      def new_optional
        @optional = current_candidate.subscribe_optionals.new
      end

      def create_optional
        @optional = current_candidate.subscribe_optionals.new(set_params_optional)
        @optional.save if ::Subscribe.allow_project?
      end

      def destroy
        @team = current_candidate.subscribe_teams.find(params[:id])
        @team.destroy 
      end


      private

      def set_params_required
        params.require(:subscribe_team_required).permit(:name, :professional_type, :activity, :archive_path, :number_registry)
      end

      def set_params_optional
        params.require(:subscribe_team_optional).permit(:name, :professional_type)
      end

      def set_project
        @project = ::Project.friendly.find(params[:project_id])
      end
    end
  end
end