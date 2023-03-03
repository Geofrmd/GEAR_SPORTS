class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :reviews, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  STATUS = ["pending", "confirmed", "declined"]
  validates :status, inclusion: { in: STATUS }
end
