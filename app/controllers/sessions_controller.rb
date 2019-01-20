class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      redirect_to root_path, notice: "Welcome back!"
    else
      redirect_to login_path, notice: "You could not be logged in."
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You have been logged out."
  end
end
