require_dependency 'admin/application_controller'

module Admin
  class WinnersController < ApplicationController 
    before_action :set_project
    
    layout 'sub_application'

    def index
      @winners = @project.winners
    end

    def new
      @winner  = @project.winners.new
    end

    def create
      @winner  = @project.winners.new(set_params)
      
      if @winner.save
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy 
      @winner = @project.winners.find(params[:id])

      @winner.destroy 

      redirect_to action: :index
    end

    private

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

    def set_params
      params.require(:winner).permit(:subscribe_participation_id, :winner_type)
    end

  end
end