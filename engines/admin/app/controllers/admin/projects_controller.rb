require_dependency 'admin/application_controller'

module Admin
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:edit, :show, :destroy, :update]
    layout 'application', except: [:show]

    def index
      @projects = ::Project.all.order(:id)
    end

    def show
      render layout: 'sub_application'
    end
    
    def new
      @project  = ::Project.new
    end

    def create
      @project  = ::Project.new(set_params)

      if @project.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end

    end

    def edit
      
    end

    def update
      if @project.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end

    end
    
    def destroy
      if @project.destroy 
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_project
      @project = ::Project.friendly.find(params[:id])
    end

    def set_params
      params.require(:project).permit(:title, :description, :start, :end, :consult_start, :consult_end, :consult_publish, 
                                      :consult_text, :subscribe_start, :subscribe_end, :subscribe_publish, :participation_start, 
                                      :participation_end, :participation_publish, :header_color, :result_date, :result_hour, :result_publish, 
                                      :slug, :page_projects_allow, :main_page_id, :situation)

    end
  end
end