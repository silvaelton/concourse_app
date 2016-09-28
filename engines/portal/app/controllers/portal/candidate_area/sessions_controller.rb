require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class SessionsController < ApplicationController
      before_action :set_project
      before_action :redirect_session_present, only: [:new, :create]

      layout 'sub_portal'
      
      def new
        @session = Portal::Session.new
      end

      def create
        @session = Portal::Session.new(set_params)
        @session.project_id = @project.id
        
        if @session.valid?
          session[:subscribe_id] = @session.id
          redirect_to project_candidate_area_root_path(@project)
        else
          render action: :new
        end
      end


      def logout
        session[:subscribe_id] = nil
        redirect_to action: :new
      end

      private

      def set_params
        params.require(:session).permit(:subscribe_id, :password)
      end

      def redirect_session_present
        redirect_to project_candidate_area_root_path(@project) if session[:subscribe_id].present?
      end

      def set_project
        @project = Project.friendly.find(params[:project_id])
      end

    end
  end
end
