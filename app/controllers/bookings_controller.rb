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

  # def index
  #   @venue = Venue.find(params[:venue_id])
  #   @owner_bookings = Booking.where(@venue.user_id == current_user)
  #   @owner_bookings_pending = @owner_bookings.where status: 0
  # end

  def confirm
  end

  def decline
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
