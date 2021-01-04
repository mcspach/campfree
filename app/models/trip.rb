class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :site

  validates :arrival_date, presence: true
  validates :departure_date, presence: true
end
