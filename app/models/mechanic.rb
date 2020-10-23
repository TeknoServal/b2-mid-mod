class Mechanic < ApplicationRecord
  validates_presence_of :name, :experience

  has_many :rides, through: :ride_mechanics
end
