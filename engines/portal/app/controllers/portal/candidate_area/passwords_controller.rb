require_dependency 'portal/application_controller'

module Portal
  module CandidateArea
    class PasswordsController < ApplicationController
      before_action :set_project

      layout 'sub_portal'

      def index
        @subscribes = @project.subscribes.where(cpf: params[:by_cpf].to_s.gsub('-','').gsub('.',''))
      end

      def edit
        @subscribe  = @project.subscribes.find_by(token: params[:id]) rescue nil
        redirect_to action: :index  if @subscribe.nil?
      end

      def update
        @subscribe  = @project.subscribes.find_by(token: params[:id]) rescue nil

        if @subscribe.update(set_params)
          @subscribe.token = nil
          @subscribe.save

          flash[:success] = t :success
          redirect_to project_candidate_area_root_path(@project)
        else
          render action: :edit
        end
      end

      def remember
        @subscribe  = @project.subscribes.find(params[:password_id])
        @subscribe.token = Digest::SHA1.hexdigest([Time.now, rand].join)
        if @subscribe.save
          Portal::SubscribeMailer.remember(@subscribe, @subscribe.project).deliver_now!
          redirect_to project_candidate_area_password_success_path(@project, @subscribe)
        else 
          redirect_to action: :index
        end
      end

      def success
        @subscribe  = @project.subscribes.find(params[:password_id])
        
        redirect_to project_candidate_area_root_path(@project) if !@subscribe.token.present?
      end

      private

      def set_params
        params.require(:subscribe).permit(:password, :password_confirmation)
      end
      
      def set_project
        @project = ::Project.friendly.find(params[:project_id])
      end

    end
  end
end