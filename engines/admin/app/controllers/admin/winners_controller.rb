require_dependency 'admin/application_controller'

module Admin
  class WinnersController < ApplicationController 
    before_action :set_project
    
    layout 'sub_application'

    def index
      @consults = @project.consults
    end

    private

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

  end
end