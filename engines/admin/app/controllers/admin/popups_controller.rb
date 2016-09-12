require_dependency 'admin/application_controller'

module Admin
  class PopupsController < ApplicationController 
    before_action :set_project
    
    layout 'sub_application'

    def index
    end

    private

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

  end
end