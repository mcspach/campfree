class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # ask TA if we need to use current_user here?
    if @user.save
      redirect_to user_path(@user), notice: "You have successfully created your profile!!"
    else
      render :new
    end
  end

  def tents
    @tents = Tent.where(user: current_user)
  end

  def bookings
    @bookings = Booking.where(user: current_user)
  end

  def show
    @user = User.find(params[:id]) # ask TA if we need to use current_user here?
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
    redirect_to root_path, notice: "Thank you for using Outpost!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :username, :photo)
  end
end
