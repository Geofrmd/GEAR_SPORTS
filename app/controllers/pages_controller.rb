class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # add other pages to "only" list

  def home
    @offers = Offer.last(3)
  end
end
