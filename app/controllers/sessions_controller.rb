class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:session][:name]
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(name, email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
   private
  def login(name, email, password)
    @user = User.find_by(name: name)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(email, password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end