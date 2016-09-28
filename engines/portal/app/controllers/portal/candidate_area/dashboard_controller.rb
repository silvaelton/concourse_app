require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class DashboardController < ApplicationController
      before_action :set_project
      before_action :subscribe_authenticate!
      
      layout 'sub_portal'

      def index
      end
    

      private

      def set_project
        @project = ::Project.friendly.find(params[:project_id])
      end      
    end
  end
end
