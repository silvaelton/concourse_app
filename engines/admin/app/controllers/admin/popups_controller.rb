require_dependency 'admin/application_controller'

module Admin
  class PopupsController < ApplicationController 
    before_action :set_project
    before_action :set_popup, only: [:edit, :update, :destroy]
    
    layout 'sub_application'

    def index
      @popups = @project.popups
    end

    def new
      @popup = @project.popups.new
    end

    def create
      @popup = @project.popups.new(set_params)
      
      if @popup.save 
        flash[:success] =  t :success
        redirect_to action: :index
      else 
        render action: :new
      end
    end

    def edit
    end

    def update
      if @popup.update(set_params)
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      @popup.destroy
      flash[:success] =  t :success
      redirect_to action: :index
    end

    private

    def set_params
      params.require(:popup).permit(:title, :content, :link, :publish)
    end

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

    def set_popup
      @popup = @project.popups.find(params[:id])
    end

  end
end