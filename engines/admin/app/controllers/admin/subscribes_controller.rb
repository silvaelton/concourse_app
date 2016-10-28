require_dependency 'admin/application_controller'

module Admin
  class SubscribesController < ApplicationController 
    before_action :set_project
    
    layout 'sub_application'

    def index
      @consults = @project.consults
    end

    def show
      @subscribe = @project.subscribes.find(params[:id])
    end

    def edit
      @subscribe = @project.subscribes.find(params[:id])
    end

    def update
      @subscribe = @project.subscribes.find(params[:id])
      @subscribe.update(set_params)
    end

    def update_paid
      @subscribe = @project.subscribes.find(params[:subscribe_id])

      @subscribe.paid = @subscribe.paid ? false : true
      @subscribe.save
      
    end

    private

    def set_params
      params.require(:subscribe).permit(:paid, :situation)
    end

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

  end
end