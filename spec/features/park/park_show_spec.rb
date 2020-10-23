require 'rails_helper'

# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that park
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00

#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10

describe 'As a visitor' do
  before(:each) do
    @park1 = Park.create!(name: 'Wonder Fun Land', admission_price: 25.50)

  end
  describe 'When I visit an amusement parks show page' do
    it 'I see the name and price of admissions for that park' do
      visit "/parks/#{@park1.id}"

      expect(page).to have_content(@park1.name)
      expect(page).to have_content(@park1.admission_price.to_s)
    end
  end
end
