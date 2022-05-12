require 'rails_helper'

RSpec.describe "gyms#index", type: :feature do

  # User Story 1, Parent Index
  #
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it "displays names of gyms" do
    gym_1 = Gym.create(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
    gym_2 = Gym.create(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
    visit "/gyms"

    expect(page).to have_content(gym_1.name)
    expect(page).to have_content(gym_2.name)
  end
end
