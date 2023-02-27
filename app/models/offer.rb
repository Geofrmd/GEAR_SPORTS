class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  CATEGORY = ["kitesurf", "paddle", "planche à voile","planche de surf", "vélo", "roller", "ski", "snowboard", "skateboard", "raquette de tennis"]
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 1}
  validates :location, presence: true
  validates :picture_url, presence: true
  validates :sport_category, presence: true, inclusion: { in: CATEGORY, message: "Please select existing sport category"}
end