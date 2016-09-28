module Portal
  class ApplicationController < ActionController::Base
    layout 'portal'

    def current_candidate
      ::Subscribe.find(session[:subscribe_id]) rescue nil
    end

    def subscribe_authenticate! 
      if current_candidate.nil?
        redirect_to new_project_candidate_area_session_path if controller_name != 'sessions'
      end
    end
    
    helper_method :current_candidate
    helper_method :subscribe_authenticate!
  end
end
