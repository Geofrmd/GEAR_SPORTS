class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # add other pages to "only" list

  def home
  end

  def dashboard
    @my_offers = Offer.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
