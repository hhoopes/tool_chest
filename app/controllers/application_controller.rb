class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :most_recent_tool,
                :current_user,
                :current_admin?

  def most_recent_tool
    if current_user
      id = session[:user_id]
      User.find(id).tools.last
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end


  protect_from_forgery with: :exception


end
