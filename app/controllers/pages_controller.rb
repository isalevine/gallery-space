class PagesController < ApplicationController
  skip_before_action :authenticate_user, except: [:destroy_session_logout]

  def main
  end

  def create_session_login
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:message] = 'Incorrect Login'
      redirect_to root_path
    end
  end

  def destroy_session_logout
    session.clear
    flash[:message] = "You have logged out."
    redirect_to root_path
  end

end
