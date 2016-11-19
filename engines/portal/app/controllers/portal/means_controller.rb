require_dependency 'portal/application_controller'

module Portal
	class MeansController < ApplicationController 
		before_action :set_project

    layout 'sub-portal'
    
		def index
			@means = @project.means
		end 

		def new
			@means = @project.means.new
		end

		def create
			@means = @project.means.new(set_params)

      if @means.save
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
	end
end