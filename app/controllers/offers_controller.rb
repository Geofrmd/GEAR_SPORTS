class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offers = Offer.find(params[:id])
    authorize @offer
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
    redirect_to offer_path(@offer)
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :location, :picture_url, :sport_category)
  end
end
