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

  desribe "User Story 7" do

    # User Story 7, Parent Child Count
    #
    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
    it "counts the routes within a gym" do
      Gym.destroy_all
      RopeRoute.destroy_all
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
      rope_3 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
      rope_4 = gym_2.rope_routes.create!(grade: '5.8', color: 'White', top_rope: true, lead: true, height: 38)

      visit "/gyms/#{gym_1.id}"
      save_and_open_page

      expect(page).to have_content(gym_1.name)
      expect(page).to have_content("Counts of Rope Routes: 2")
    end
  end
end
