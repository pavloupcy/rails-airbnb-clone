class BookingsController < ApplicationController
  def index
      @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
 
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.state == true 
      if @booking.save
        redirect_to bookings_path
      else
        render :new
      end
    else
      @booking.destroy
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:state, :renter_id, :treehouse_id, :start_date, :end_date, :price, :guest_count)
  end
end