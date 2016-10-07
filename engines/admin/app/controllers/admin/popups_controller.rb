require_dependency 'admin/application_controller'

module Admin
  class PopupsController < ApplicationController 
    before_action :set_project
    
    layout 'sub_application'

    def index
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

  end
end