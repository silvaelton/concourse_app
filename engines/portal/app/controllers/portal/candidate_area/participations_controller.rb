require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class ParticipationsController < ApplicationController
      before_action :set_project 
      before_action :redirect_session_present

      layout 'sub_portal'

      def index
        redirect_to action: :new
      end

      def new
      end

      def upload_document
        @file = current_candidate.subscribe_participations.new(set_params)
        if @file.save
          redirect_to action: :index
        else
          render action: :new 
        end
        
      end

      def destroy
        @participation = ::SubscribeParticipation.find(params[:id])
        @participation.destroy 

        redirect_to action: :index
      end

      private

      def set_project
        @project = ::Project.friendly.find(params[:project_id])
      end

      def redirect_session_present
        redirect_to project_candidate_area_root_path(@project) if session[:subscribe_id].nil?
      end

      def set_params
        params.require(:subscribe_participation).permit(:participation_path, :participation_id)
      end

    end
  end
end
