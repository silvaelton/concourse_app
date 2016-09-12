require_dependency 'portal/application_controller'

module Portal
  class SubscribesController < ApplicationController
    before_action :set_project

    layout 'sub_portal'

    def index
      redirect_to action: :new
    end
    
    def new
      @subscribe = @project.subscribes.new
    end

    def create
    end

    private

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end
   
  end
end
