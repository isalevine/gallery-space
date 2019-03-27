class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  before_action :authenticate_user

  def current_user
    if !User.exists?(session[:user_id])
      session.clear
    else
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate_user
    # if !logged_in?
    #   redirect_to root_path
    # end
  end



end
