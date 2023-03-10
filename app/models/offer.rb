class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :picture_url
  CATEGORY = ["kitesurf", "paddle", "planche à voile", "planche de surf", "vélo", "roller", "ski", "snowboard", "skateboard", "raquette de tennis"]
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 1}
  validates :location, presence: true
  validates :sport_category, presence: true, inclusion: { in: CATEGORY, message: "Please select existing sport category"}
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
