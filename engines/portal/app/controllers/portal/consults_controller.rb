require_dependency 'portal/application_controller'

module Portal
  class ConsultsController < ApplicationController
    before_action :set_project

    layout 'sub_portal'

    def index
      redirect_to action: :new
    end

    def new
      @consult = @project.consults.new
    end

    def create
      @consult = @project.consults.new(set_params)
      
      if @consult.save
        flash[:success] = t :success
        render action: :success
      else
        render action: :new
      end

    end

    def success
    end

    private

    def set_params
      params.require(:consult).permit(:content)
    end

    def set_project
      @project = Project.friendly.find(params[:project_id])
      @popup = @project.popups.find_by(link: request.original_fullpath) rescue nil
    end
  end
end