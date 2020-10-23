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
end
