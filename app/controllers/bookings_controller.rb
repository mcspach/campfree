class BookingsController < ApplicationController

  def new
    @tent = Tent.find(params[:tent_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @tent = Tent.find(params[:tent_id])
    @booking.tent = @tent
    @booking.user = current_user
    if @booking.save!
      redirect_to bookings_user_path(current_user), notice: "You have successfully booked this tent!"
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @tent = @booking.tent
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_user_path(current_user)
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
