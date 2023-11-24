class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)
    @venue = Venue.find(params[:venue_id])
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to venue_path(@venue)
      flash[:alert] = "No time travel allowed. Please select a date in the future."
    end
  end

  # def index
  #   @venue = Venue.find(params[:venue_id])
  #   @owner_bookings = Booking.where(@venue.user_id == current_user)
  #   @owner_bookings_pending = @owner_bookings.where status: 0
  # end

  def update
    @booking = Booking.find(params[:id])
    if params[:commit] == "CONFIRM"
      @booking.status = 1
    else
      @booking.status = 2
    end
    @booking.save!
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:date, current_user)
  end
end
