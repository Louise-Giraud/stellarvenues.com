class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)
    @venue = Venue.find(params[:venue_id])
    @booking.venue = @venue
    @booking.save!
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :current_user)
  end
end
