require_dependency 'portal/application_controller'

module Portal
  class ProjectsController < ApplicationController
    layout 'sub_portal', except: :index

    def index
      @project_actives  = ::Project.actives.order(:id)
      @project_waiting  = ::Project.waiting.order(:id)

      render layout: 'portal'
    end

    def show
      @project = ::Project.friendly.find(params[:id])
      @popup = @project.popups.find_by(link: request.original_fullpath) rescue nil
    end

  end
end
