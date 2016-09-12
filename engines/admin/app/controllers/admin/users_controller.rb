require_dependency 'admin/application_controller'

module Admin
  class UsersController < ApplicationController 
    before_action :set_user, only: [:edit, :update, :destroy]

    def index
      @users = ::User.all.order('id DESC')
    end

    def new
      @user = ::User.new
    end

    def create
      @user = ::User.new(set_params)
      
      if @user.save 
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update

      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete :password
        params[:user].delete :password_confirmation
      end
      
      if @user.update(set_params) 
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :edit
      end      
    end

    def destroy
      if @user.destroy
        flash[:success] = t :success
      else 
        flash[:danger] = t :danger
      end 

      redirect_to action: :index
    end

    private

    def set_user
      @user = ::User.find(params[:id])
    end

    def set_params
      params.require(:user).permit(:name, :email, :password, :privilege, :password_confirmation, :status)
    end
  end
end