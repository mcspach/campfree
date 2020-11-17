class BookingsController < ApplicationController

  def new
    @tent = Tent.find(params[:tent_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @tent = Tent.find(params[:tent_id])
    @booking.tent = @tent
    @booking.save
    redirect_to tent_path(@tent)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update ## check this code with the TA?
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
