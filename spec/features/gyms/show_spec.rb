require 'rails_helper'

RSpec.describe 'gyms#show', type: :feature do

  # User Story 2, Parent Show
  #
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it 'displays gyms data and attributes' do
    gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
    gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
    visit "/gyms/#{gym_1.id}"

    expect(page).to have_content(gym_1.name)
    expect(page).to_not have_content(gym_2.name)
  end
end
