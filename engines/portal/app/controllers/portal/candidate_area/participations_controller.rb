require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class ParticipationsController < ApplicationController
      #before_action :subscribe_authenticate!
      before_action :set_project 

      layout 'sub_portal'

      def new
        @juridical = ::Participation.juridical
        @participation = ::Participation.normal

      end

      def create
      end

      private

      def set_project
        @project = ::Project.friendly.find(params[:project_id])
      end

    end
  end
end
