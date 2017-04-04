class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:successful_signin] = "Successfully Signed In"
      redirect_to links_path
    else
      flash[:unsuccessful_signin] = "Email and password do not match. Try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/signin'
  end
end
