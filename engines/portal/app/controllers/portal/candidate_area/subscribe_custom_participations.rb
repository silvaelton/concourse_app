require_dependency 'portal/application_controller'
module Portal
  module CandidateArea
    class SubscribeCustomParticipationsController < ApplicationController

      before_action :set_project
      before_action :set_subscribe
      before_action :subscribe_authenticate!
      
      layout 'sub_portal'

      def new
        if (Date.current >= Date.parse('2017-04-18')) && (Date.current <= Date.parse('2017-04-20'))
          if ::SubscribeCustomParticipation.unscoped.where(subscribe_id: current_candidate.id, special: true).present?
            @participation = ::SubscribeCustomParticipation.unscoped.where(subscribe_id: current_candidate.id, special: true).first
          else 
            @participation = ::SubscribeCustomParticipation.unscoped.where(subscribe_id: current_candidate.id, special: true).new
          end
        else
          flash[:danger] = 'Envio de projeto fechado. Verifique o cronograma.'
          redirect_to project_candidate_area_root_path(@project)
        end

      end

      def create
        if (Date.current >= Date.parse('2017-04-18')) && (Date.current <= Date.parse('2017-04-20'))
          @participation = ::SubscribeCustomParticipation.unscoped.where(subscribe_id: current_candidate.id, special: true).new(set_params)
          @participation.subscribe_id = current_candidate.id
          
          if @participation.save
            redirect_to action: :new
          else
            render action: :new
          end
        else
          flash[:danger] = 'Envio de projeto fechado. Verifique o cronograma.'
          redirect_to project_candidate_area_root_path(@project)
        end
 
      end

      def show
        @participation = ::SubscribeCustomParticipation.unscoped.where(subscribe_id: current_candidate.id, special: true).find(params[:id])
      end

      def edit
        
        if ::SubscribeCustomParticipation.unscoped.where(subscribe_id: current_candidate.id, special: true).present?
          @participation = ::SubscribeCustomParticipation.unscoped.where(subscribe_id: current_candidate.id, special: true).find(params[:id])
        else 
          redirect_to action: :new
        end

      end

      def update
        @participation = ::SubscribeCustomParticipation.unscoped.where(subscribe_id: current_candidate.id, special: true).find(params[:id])
        
        if @participation.update(set_params)
          redirect_to action: :new
        else
          render action: :new
        end
      end

      private


      def set_project
        @project = ::Project.friendly.find(params[:project_id])
      end

      def set_subscribe
        @subscribe = current_candidate
      end

      def set_params
        params.fetch(:subscribe_custom_participation, {})
              .permit(:archive_file_one,:archive_file_two, :archive_file_three, :archive_file_four, 
                      subscribe_custom_teams_attributes:[:name, :job, :_destroy, :id, :cpf])
      end
        

    end
  end
end