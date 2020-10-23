require 'rails_helper'

# As a user,
# When I visit a mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# Ex:
#              All Mechanics
#    Sam Mills - 10 years of experience
#    Kara Smith - 11 years of experience

describe 'As a user' do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: 'Bob', experience: 7)
    @mechanic2 = Mechanic.create!(name: 'Carol', experience: 9)
    @mechanic3 = Mechanic.create!(name: 'Harry', experience: 6)
    @mechanics = [@mechanic1, @mechanic2, @mechanic3]
  end
  describe 'When I visit the mechanic index page' do
    it 'I see a header with "All Mechanics" and a list of their names and experience' do
      visit '/mechanics'

      expect(page).to have_content('All Mechanics')

      page.find('.mechanic-block').each_with_index do |block, idx|
        within(@mechanics[idx]) do
          expect(page).to have_content(@mechanics[idx].name)
          expect(page).to have_content(@mechanics[idx].experience)
        end
      end
    end
  end
end
