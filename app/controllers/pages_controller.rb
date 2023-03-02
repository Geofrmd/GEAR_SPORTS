class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # add other pages to "only" list

  def home
  end
end
