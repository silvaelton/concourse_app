require_dependency 'portal/application_controller'

module Portal
	class MeansController < ApplicationController 
		before_action :set_project

    layout 'sub_portal'
    
		def index
			@means = @project.means
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
	end
end