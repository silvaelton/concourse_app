require_dependency 'portal/application_controller'

module Portal
  class ParticipationController < ApplicationController
    before_action :subscribe_authenticate!
    
    def index
    end

    def show
    end
    
  end
end
