require_dependency 'admin/application_controller'

module Admin
  class PagesController < ApplicationController 
    before_action :set_project
    before_action :set_page, only: [:edit, :destroy, :update]

    layout 'sub_application'

    def index
      @pages = @project.pages
    end

    def new
      @page  = @project.pages.new
    end

    def create
      @page  = @project.pages.new(set_params)
      
      if @page.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @page.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @page.destroy 
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:page).permit(:title, :content, :publish)
    end

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

    def set_page
      @page    = @project.pages.find(params[:id])
    end

  end
end