class Park < ApplicationRecord
  validates_presence_of :name, :admission_price

  has_many :rides

  def average_thrill_rating
    rides.average(:thrill_rating)
  end
end
