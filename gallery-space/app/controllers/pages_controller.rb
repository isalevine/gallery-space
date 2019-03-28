class PagesController < ApplicationController
  # includes code from lecture notes on SessionsController, found here:
  # https://github.com/learn-co-students/seattle-web-021819/blob/master/25-more-auth/app/controllers/sessions_controller.rb

  skip_before_action :authenticate_user, except: [:main_logged_in, :destroy_session_logout]

  def main
    if session[:user_id] && User.exists?(session[:user_id])
      redirect_to logged_in_path
    end
  end

  def main_logged_in
    # if User doesn't exist (ex. due to 'rake db:seed'),
    # redirect to 'main page'
    # ...could this be combined/refactored with the
    # method below, 'destroy_session_logout'??
    if !User.exists?(session[:user_id])
      session.clear
      redirect_to root_path
    end
  end

  def create_session_login
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to logged_in_path
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

  # CODE BELOW DOES NOT CATCH ERRORS WHEN NAVIGATING
  # TO URLS FROM THE ROOT DIRECTOR (i.e. 'localhost:3000/random')
  # around_action :catch_not_found
  #
  # private
  #
  # def catch_not_found
  #   yield
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to galleries_path, :flash => { :error => "Record not found." }
  # end

end
