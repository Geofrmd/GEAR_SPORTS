class OffersController < ApplicationController
  def index
    if params[:sport_category].present?
      @offers = Offer.where("title ILIKE '%#{params[:sport_category]}%'")
    elsif params[:query].present?
      sql_query = "title ILIKE :query OR location ILIKE :query"
      @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
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
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :location, :sport_category, picture_url: [])
  end
end
