class BookingsController < ApplicationController
  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
