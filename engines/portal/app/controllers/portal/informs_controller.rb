require_dependency 'portal/application_controller'

module Portal
  class InformsController < ApplicationController
    before_action :set_project

    layout 'sub_portal'

    def index
      @informs = @project.informs
    end

    private

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end
  end
end
