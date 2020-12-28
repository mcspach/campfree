class TripsController < ApplicationController

  def new
    @site = Site.find(params[:site_id])
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @site = Site.find(params[:site_id])
    @trip.site = @site
    @trip.user = current_user
    if @trip.save!
      redirect_to trips_user_path(current_user), notice: "You have successfully booked this tent!"
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    @site = @trip.site
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trips_user_path(current_user)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to site_path(@trip.site)
  end

  private

  def trip_params
    params.require(:trip).permit(:checkin_date, :checkout_date)
  end
end
