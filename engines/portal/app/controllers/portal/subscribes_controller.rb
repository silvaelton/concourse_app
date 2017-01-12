require_dependency 'portal/application_controller'

module Portal
  class SubscribesController < ApplicationController
    before_action :set_project

    layout 'sub_portal'

    def index
      
    end
    
    def new
      @subscribe = @project.subscribes.new
    end

    def create
      @subscribe = @project.subscribes.new(set_params)

      if @subscribe.save 
        session[:subscribe_id] = @subscribe.id

        ::Portal::SubscribeMailer.success(@subscribe, @subscribe.project).deliver_now! rescue nil
        
        redirect_to action: :success
      else
        render action: :new 
      end
    end

    def success
      @subscribe = @project.subscribes.find(session[:subscribe_id])
    end

    private

    def set_params
      params.require(:subscribe).permit(:name, :cpf, :born, :cep, :city, :state_id,
                                        :address, :fantasy_name, :social_reason, 
                                        :social_contract, :state_number, :gender,
                                        :local_subscribe, :cnpj, :email, :tecnical_responsible,
                                        :telephone, :celphone, :password, :password_confirmation,
                                        :tecnical_observation, :professional_type, :professional_document)
    end


    def set_project
      @project = ::Project.friendly.find(params[:project_id])
      @popup = @project.popups.find_by(link: request.original_fullpath) rescue nil
    end
   
  end
end
