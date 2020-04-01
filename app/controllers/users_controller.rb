class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created!"
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User created!"
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
