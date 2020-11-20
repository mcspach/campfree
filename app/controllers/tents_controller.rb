class TentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:state].present?
      if params[:state] == 'All States'
        @tents = Tent.geocoded
      else
        @tents = Tent.geocoded.where("state ILIKE ? ", params[:state])
      end
    else
      @tents = Tent.geocoded
    end
  end

  def show
    @tent = Tent.find(params[:id])
    @booking = Booking.new
    @markers = [{
          lat: @tent.latitude,
          lng: @tent.longitude
      }]
  end

  def new
    @tent = Tent.new
  end

  def create
    @tent = Tent.new(tent_params)
    @tent.user = current_user
    if @tent.save
      redirect_to tent_path(@tent), notice: "You have successfully listed your tent!"
    else
      render :new
    end
  end

  def edit
    @tent = Tent.find(params[:id])
  end

  def update
    @tent = Tent.find(params[:id])
    @tent.update(tent_params)
    redirect_to tent_path(current_user)
  end

  def destroy
    @tent = Tent.find(params[:id])
    @tent.destroy
    redirect_to root_path, notice: "Thank you for using Outpost fucker!"
  end

  private

  def tent_params
    params.require(:tent).permit(:title, :description, :price, :state, :address, :user_id, :latitude, :longitude, photos: [])
  end
end
