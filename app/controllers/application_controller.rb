class ApplicationController < ActionController::Base

  add_flash_types :success, :warning, :danger, :info
  
	private
  def current_user
    User.where(id: session[:user_id]).first
  end
  
  helper_method :current_user

end
