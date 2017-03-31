require_dependency 'portal/application_controller'

module Portal
  class ParticipationsController < ApplicationController 
    before_action :set_project

    layout 'sub_portal'

    def all
      if @project.id == 3
        @projects = ::SubscribeCustomParticipation.all.order(:id)
      end

      if @project.id == 1
        participation = ::Participation.find_by(name: "Prancha A1 (PDF até 15mb)") rescue nil
        @projects = ::SubscribeParticipation.where(participation_id: participation.id)
      end
    end

    def winners
      @projects = @project.winners
    end

    private

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end
    
  end
end