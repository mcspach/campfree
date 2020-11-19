class Tent < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
end
