class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @users=User.all
  end
  
  def show
  end
  
  def new
    @user=User.new
  end
  
  def edit
    if @user == current_user
      render "edit"
    else
      redirect_to root_path, notice: "Must be the User or Admin"
    end
  end

  def update 
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "User update"
    else
      flash.now[:alert] = @user.errors.full_messages[0]
      render "edit"
    end
  end

  def create
    @user = User.new(user_params)
  end
  
  def destroy
    if @user == current_user
      @user.destroy
      redirect_to root_path, notice: "User destroy"
    else
      redirect_to root_path, notice: "Must be the User or Admin"
    end
  end
  
  #######
  private
  #######
  
  def set_user
    @user=User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :description)
  end
  
end