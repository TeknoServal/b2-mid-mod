class Ride < ApplicationRecord
  validates_presence_of :name, :thrill_rating

  belongs_to :park
  has_many :mechanics, through: :ride_mechanics
end
