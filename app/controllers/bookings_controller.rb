class BookingsController < ApplicationController
  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      offer: @offer,
      user: current_user
    )
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    @offer = Offer.find(@booking.offer_id)
    @booking.user = current_user
    authorize @booking
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    @booking.start_date = params[:start_date]
    @booking.end_date = params[:end_date]
    @booking.offer = @offer
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dashboard_path(@offer, @booking)
    else
      render 'offers/show', status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params[:booking][:status]
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
