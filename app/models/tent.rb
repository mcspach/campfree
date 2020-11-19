class Tent < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :state, presence: true

end
