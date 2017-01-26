require_dependency 'admin/application_controller'

module Admin
  class SubscribeObservationsController < ApplicationController
    before_action :set_subscribe

    def new
      @observation = @subscribe.subscribe_observations.new
    end

    def create
      @observation = @subscribe.subscribe_observations.new(set_params)
      @observation.save
    end

    private

    def set_params
      params.require(:subscribe_observation).permit(:content)
    end

    def set_subscribe
      @project   = ::Project.friendly.find(params[:project_id]) rescue nil
      @subscribe = @project.subscribes.find(params[:subscribe_id]) rescue nil
    end


  end
end