class Site < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :trips, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :address, presence: true
  validates :state, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
