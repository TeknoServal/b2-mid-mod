require 'rails_helper'

describe Ride, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of :name
      should validate_presence_of :thrill_rating
    end
  end

  describe 'relationships' do
    it do
      should belong_to :park
      should have_many :mechanics
    end
  end
end
