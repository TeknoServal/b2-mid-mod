require 'rails_helper'

# As a user,
# When I go to a mechanics show page
# I see their name, years of experience, and names of all rides they’re working on
# And I also see a form to add a ride to their workload
# When I fill in that field with an id of a ride that exists in the database
# And I click submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
# Add a ride to workload:
# _pretend_this_is_a_textfield_
#                       Submit

describe 'As a user' do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: 'Bob', experience: 7)
    @mechanic2 = Mechanic.create!(name: 'Carol', experience: 9)
    @mechanic3 = Mechanic.create!(name: 'Harry', experience: 6)

    @park1 = Park.create!(name: 'Wonder Fun Land', admission_price: 25.50)

    @ride1 = @park1.rides.create!(name: 'Poo Poo Pee Pants', thrill_rating: 4)
    @ride2 = @park1.rides.create!(name: 'Holy Amazeballs', thrill_rating: 8)
    @ride3 = @park1.rides.create!(name: 'Whoopy McWhoopFace', thrill_rating: 8)

    @rides = [@ride1, @ride2]

    @mechanic1.rides << @ride1
    @mechanic1.rides << @ride2
  end

  describe 'When I go to a mechanics show page' do
    it 'I see their name, years of experience, and names of all rides theyre working on' do
      visit "/mechanics/#{@mechanic1.id}"

      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic1.experience)

      ride_blocks = page.all('.ride-block')

      expect(ride_blocks[0]).to have_content(@ride2.name)
      expect(ride_blocks[1]).to have_content(@ride1.name)
    end

    it 'I see a field to add a ride theyre working on and fill it out and expect above^' do
      visit "/mechanics/#{@mechanic1.id}"

      fill_in('new_ride', with: 'Whoopy McWhoopFace')

      click_button('Submit')

      expect(page).to have_current_path("/mechanics/#{@mechanic1.id}")
      expect(page).to have_content('Whoopy McWhoopFace')
    end
  end
end
