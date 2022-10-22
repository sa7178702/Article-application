class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user.nil?
      flash[:alert] = "Invalid user sign up ? "
      redirect_to new_user_path
    else
      if user.password_digest == (params[:session][:password_digest])
        session[:user_id] = user.id
         # UsermailerMailer.welcome_email(@user).deliver
        redirect_to users_path
        flash[:notice] = "#{user.name} Login Successful ? "
      else
        flash[:notice] = "User not present ? "
      end
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:alert] = "Log out ? "
  end
end
