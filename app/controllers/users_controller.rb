class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "You have successfully created your profile!"
    else
      render :new
    end
  end

  def sites
    @sites = Site.where(user: current_user)
  end

  def trips
    @trips = Trip.where(user: current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "Thank you for using DirtBag Map!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :username, :photo)
  end
end
