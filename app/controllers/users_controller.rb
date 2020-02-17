class UsersController < ApplicationController
    before_action :require_user_logged_in 
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @tasks = @user.task.order(id: :desc).page(params[:page])
    counts(@user)
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'アカウント作成しました'
      redirect_to @user
    else
       flash.now[:danger] = 'アカウント作成に失敗しました'
       render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
