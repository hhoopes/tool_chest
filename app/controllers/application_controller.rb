class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def most_recent_tool
    if Tool.exists?
      id = session[:most_recent_tool_id]
      Tool.find(id)
    end
  end



  protect_from_forgery with: :exception


end
