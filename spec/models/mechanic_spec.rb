require 'rails_helper'

describe Mechanic, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of :name
      should validate_presence_of :experience
    end
  end

  describe 'relationships' do
    it do
      should have_many(:rides).through(:ride_mechanics)
    end
  end

  describe 'instance methods' do
    before(:each) do
      @mechanic1 = Mechanic.create!(name: 'Bob', experience: 7)
      @mechanic2 = Mechanic.create!(name: 'Carol', experience: 9)
      @mechanic3 = Mechanic.create!(name: 'Harry', experience: 6)

      @park1 = Park.create!(name: 'Wonder Fun Land', admission_price: 25.50)

      @ride1 = @park1.rides.create!(name: 'Poo Poo Pee Pants', thrill_rating: 4)
      @ride2 = @park1.rides.create!(name: 'Holy Amazeballs', thrill_rating: 8)

      @mechanic1.rides << @ride1
      @mechanic1.rides << @ride2
    end

    it '#alph_rides' do
      expect(@mechanic1.rides[0]).to eq(@ride1)
      expect(@mechanic1.rides[1]).to eq(@ride2)
    end
  end
end
