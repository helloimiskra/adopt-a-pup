class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :authenticate_user

  def current_user

 
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]

  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      redirect_to '/'
    end
  end
  
end
