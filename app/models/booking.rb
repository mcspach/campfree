class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tent

  validates :checkin_date, :checkout_date, presence: true
end
