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
end
