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
        @projects = ::SubscribeParticipation.all.order(:id)
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