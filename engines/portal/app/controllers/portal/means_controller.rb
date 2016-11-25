require_dependency 'portal/application_controller'

module Portal
	class MeansController < ApplicationController 
    before_action :set_project
		before_action :set_authenticate

    layout 'sub_portal'
    
		def index
			@means = @project.means
		end 

    def show
			@mean = @project.means.find(params[:id])
    end
    
    def new
      @mean = @project.means.new
		end

		def create
			@mean = @project.means.new(set_params)

      if @mean.save
        flash[:green] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
		end

		private

		def set_params
			params.require(:mean).permit(:subscribe_id, :password, :content)
		end

		def set_project
			@project = ::Project.friendly.find(params[:project_id])
		end

    def set_authenticate
      @user = ::User.find(session[:admin_id]) rescue nil
      
      redirect_to '/404' if @user.nil?
    end
	end
end