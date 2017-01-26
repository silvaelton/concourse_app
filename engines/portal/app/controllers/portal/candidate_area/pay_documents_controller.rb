require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class PayDocumentsController < ApplicationController
      before_action :set_project
      before_action :subscribe_authenticate!
        
      layout 'sub_portal'

      def edit
        @subscribe = current_candidate
      end

      def update
        @subscribe = current_candidate
        @subscribe.update(set_params)

        flash[:success] = t :success
        redirect_to action: :edit
      end

      private

      def set_project
        @project = ::Project.friendly.find(params[:project_id])
      end 

      def set_params
        params.fetch(:subscribe, {}).permit(:paid_document)
      end
   
    end
  end
end
