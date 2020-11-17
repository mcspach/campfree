class Tent < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true

end
