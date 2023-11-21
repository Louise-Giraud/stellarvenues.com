class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :capacity, :description)
  end
end
