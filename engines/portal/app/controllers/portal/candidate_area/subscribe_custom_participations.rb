require_dependency 'portal/application_controller'
module Portal
  module CandidateArea
    class SubscribeCustomParticipationsController < ApplicationController

      before_action :set_project
      before_action :set_subscribe
      before_action :subscribe_authenticate!
      
      layout 'sub_portal'

      def new

        if current_candidate.subscribe_custom_participations.present?
          @participation = current_candidate.subscribe_custom_participations.first
        else 
          @participation = current_candidate.subscribe_custom_participations.new
        end

      end

      def create
        @participation = current_candidate.subscribe_custom_participations.new(set_params)

        if @participation.save
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
              .permit(:archive_file_one,:archive_file_two, 
                      subscribe_custom_teams_attributes:[:name, :job, :_destroy, :id, :cpf])
      end
        

    end
  end
end