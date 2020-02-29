class UsersController < ApplicationController
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
