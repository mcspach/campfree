class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tent

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
end
