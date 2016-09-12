require_dependency 'admin/application_controller'

module Admin
  class NavsController < ApplicationController 
    before_action :set_project
    before_action :set_nav, only: [:edit, :destroy, :update]

    layout 'sub_application'

    def index
      @navs = @project.navs
    end

    def new
      @nav  = @project.navs.new
    end

    def create
      @nav  = @project.navs.new(set_params)
      
      if @nav.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @nav.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @nav.destroy 
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:nav).permit(:label, :href, :page_id, :self_open, :is_page, :order, :publish)
    end

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

    def set_nav
      @nav    = @project.navs.find(params[:id])
    end

  end
end