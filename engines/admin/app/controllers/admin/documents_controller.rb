require_dependency 'admin/application_controller'

module Admin
  class DocumentsController < ApplicationController
    before_action :set_project 

    layout 'sub_application'

    def index
      @participations = ::SubscribeParticipation.where(participation_id: 1)
    end

    def show
      @participation  = ::SubscribeParticipation.find(params[:id])
      @subscribe      = @participation.subscribe
    end
  
    private

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end
    
  end
end