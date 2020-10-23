require 'rails_helper'

describe Park, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of :name
      should validate_presence_of :admission_price
    end
  end

  describe 'relationships' do
    it do
      should have_many :rides
    end
  end

  describe 'instance methods' do
    before(:each) do
      @park1 = Park.create!(name: 'Wonder Fun Land', admission_price: 25.50)

      @ride1 = @park1.rides.create!(name: 'Poo Poo Pee Pants', thrill_rating: 4)
      @ride2 = @park1.rides.create!(name: 'Holy Amazeballs', thrill_rating: 8)
    end

    it '#average_thrill_rating' do
      expect(@park1.average_thrill_rating).to eq(6)
    end
  end
end
