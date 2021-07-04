class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :is_admin?
  
    def index
      @users = User.all
    end

    def show
    end
  
    def edit
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'User destroy'
    end
  
    def update
      @user.update(post_params)
      redirect_to admin_users_path, notice: 'Admin update'
    end
    
    #######
    private
    #######

    def set_user
        @user=User.find(params[:id])
    end

    def post_params
      params.require(:user).permit(:admin)
    end

    def is_admin?
        if current_user.is_admin? != true
          flash[:notice] = "Must be Admin"
          redirect_to root_path
        end
    end

end