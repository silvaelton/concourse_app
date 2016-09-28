require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class SubscribesController < ApplicationController
      before_action :set_project
      before_action :subscribe_authenticate!
        
      layout 'sub_portal'

      def edit
        @subscribe = current_candidate
      end

      def update

        if !params[:subscribe][:password].present? && !params[:subscribe][:password_confirmation].present?
          params[:subscribe].delete :password
          params[:subscribe].delete :password_confirmation
        end

        @subscribe = current_candidate
        if @subscribe.update(set_params)
          flash[:success] =  t :success
          redirect_to project_candidate_area_root_path(@project)
        else
          render action: :edit
        end
      end
      

      private

      def set_params
        params.require(:subscribe).permit(:name, :born, :gender, :email, :telephone, :celphone, :cep, 
                                          :state_id, :city, :address, :fantasy_name, :social_reason, :cnpj, 
                                          :social_contract, :state_number, :local_subscribe, :tecnical_responsible, 
                                          :tecnical_observation, :password, :password_confirmation)

      end

      def set_project
        @project = ::Project.friendly.find(params[:project_id])
      end 
    end
  end
end
