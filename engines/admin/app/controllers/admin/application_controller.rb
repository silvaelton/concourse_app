module Admin
  class ApplicationController < ActionController::Base
    before_action :authenticate?

    layout 'application'
    
    def current_user
      ::User.find(session[:admin_id]) rescue nil
    end

    helper_method :current_user

    private

    def authenticate?
      if current_user.nil?
        redirect_to admin.new_session_path if controller_name != 'sessions'
      end
    end
  end
end
