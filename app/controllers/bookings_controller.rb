class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
  end

  # def index_by_tent
  #   @bookings = Booking.where(tent_id: params[:tent_id])
  # end

  def new
    @tent = Tent.find(params[:tent_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @tent = Tent.find(params[:tent_id])
    @booking.tent = @tent
    @booking.user = current_user
    @booking.save
    redirect_to tent_path(@tent)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to tent_path(@booking.tent) # check with the TA if this code is correct?
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date)
  end
end
