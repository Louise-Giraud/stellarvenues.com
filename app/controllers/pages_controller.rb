class PagesController < ApplicationController
  def dashboard
    @pending_bookings_as_owner = current_user.bookings_as_owner.where(status: 0)
    @confirmed_bookings_as_owner = current_user.bookings_as_owner.where(status: 1)
    @bookings_as_booker = current_user.bookings.where(status: 1)
  end
end
