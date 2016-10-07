require_dependency 'admin/application_controller'

module Admin
  class InformsController < ApplicationController 
    before_action :set_project
    before_action :set_inform, only: [:edit, :update, :destroy]
    
    layout 'sub_application'

    def index
      @informs = @project.informs
    end

    def new
      @inform = @project.informs.new
    end

    def create
      
      @inform = @project.informs.new(set_params)
      
      if @inform.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new 
      end
    end

    def edit
    end

    def update
      if @inform.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new 
      end
    end

    def destroy
      @inform.destroy
    
      flash[:success] = t :success
    
      redirect_to action: :index
    end

    private

    def set_params
      params.require(:inform).permit(:title, :description, :date, :publish, :label_link, :link)
    end

    def set_inform
      @inform = @project.informs.find(params[:id])
    end

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

  end
end