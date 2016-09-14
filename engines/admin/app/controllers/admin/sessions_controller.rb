require_dependency 'admin/application_controller'

module Admin
  class SessionsController < ApplicationController
    before_action :redirect_session_present, only: [:new, :create]

    layout 'session-application'
    
    def new
      @session = Admin::Session.new
    end

    def create
      @session = Admin::Session.new(set_params)

      if @session.valid?
        session[:admin_id] = @session.id
        redirect_to admin.root_path
      else
        render action: :new
      end
    end


    def logout
      session[:admin_id] = nil
      redirect_to action: :new
    end

    private

    def set_params
      params.require(:session).permit(:email, :password)
    end

    def redirect_session_present
      redirect_to admin.root_path if session[:admin_id].present?
    end

  end
end
