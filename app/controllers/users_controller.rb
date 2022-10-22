class UsersController < ApplicationController
  before_action :find_user , only: [:show , :edit, :update, :destroy ]

  def index
		@user = User.all
    @user = @user.paginate(page: params[:page], per_page: 3)
	end

	def new
		@user = User.new
	end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      redirect_to users_path
      flash[:notice] = "#{@user.name} Sign Up successful "
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
     unless session[:user_id] == @user.id
       flash[:notice] = "You don't have access to that order!"
       redirect_to users_path(session[:user_id])
       return
     end
  end

  def update
     # @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
      flash[:notice] = "Record Updated successfully "
    else
      render :edit
    end
  end

  def destroy
       # @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
      flash[:notice] = "User Destroyed ? "
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :address, :avatar)
  end

  def find_user
      @user = User.find(params[:id])
  end

end
