require_dependency 'admin/application_controller'

module Admin
  class ConsultsController < ApplicationController 
    before_action :set_project
    before_action :set_consults
    
    layout 'sub_application'

    def index
    end

    def show
      @consult  = @project.consults.find(params[:id])
    end

    def next_situation
      @consult = @project.consults.find(params[:consult_id])

      case @consult.situation
      when 'não_lida'
        @consult.update(situation: 1)
      when 'lida'
        @consult.update(situation: 2)
      end
    end

    private

    def set_project
      @project = ::Project.friendly.find(params[:project_id])
    end

    def set_consults
      @consults = @project.consults
    end

  end
end