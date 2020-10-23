class Mechanic < ApplicationRecord
  validates_presence_of :name, :experience

  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def alph_rides
    rides.order(:name)
  end
end
