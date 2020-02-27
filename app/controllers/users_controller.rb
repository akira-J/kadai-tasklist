class UsersController < ApplicationController
    before_action :require_user_logged_in, only: [:index, :show]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'アカウント作成しました'
      redirect_to login_url
    else
      flash.now[:danger] = 'アカウント作成に失敗しました'
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
  end
end
