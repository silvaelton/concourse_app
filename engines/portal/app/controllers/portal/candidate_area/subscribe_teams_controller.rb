require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class SubscribeTeamsController < ApplicationController
      before_action :set_project

      def new_required
        @required = @project.subscribe_requireds.new
      end

      def create_required
        @required = @project.subscribe_requireds.new(set_params_required)
        
        if @required.save
          redirect_to project_candidate_area_participations_path(@project)
        end
      end

      def new_optional
        @optional = @project.subscribe_optionals.new
      end

      def create_optional
        @optional = @project.subscribe_optionals.new(set_params_optional)
        @optional.save
      end

      def destroy
        @team = @project.subscribe_teams.find(params[:id])
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