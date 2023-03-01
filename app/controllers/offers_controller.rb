class OffersController < ApplicationController
  def index
    if params[:title].present?
      @offers = Offer.where("title LIKE '%#{params[:title]}%'")
    elsif params[:query].present?
      @offers = Offer.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
    @markers = [{lat: @offer.latitude, lng: @offer.longitude}]
    authorize @offer
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :location, :picture_url, :sport_category)
  end
end
