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

  describe "User Story 6" do
#     User Story 6, Parent Index sorted by Most Recently Created
#
#     As a visitor
#     When I visit the parent index,
#     I see that records are ordered by most recently created first
#     And next to each of the records I see when it was created
    it "displays gyms in a sorted list by creation" do
      Gym.destroy_all
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      visit "/gyms"

      # save_and_open_page
      expect("Movement Boulder").to appear_before("Movement Englewood")
      expect(page).to have_content(gym_1.name)
      expect(page).to have_content(gym_2.name)
      expect(page).to have_content(gym_1.created_at)
      expect(page).to have_content(gym_2.created_at)
    end
  end

  describe "User Story 17, Parent update" do
    # User Story 17, Parent Update From Parent Index Page
    #
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to edit that parent's info
    # When I click the link
    # I should be taken to that parents edit page where I can update its information just like in User Story 4
    it "has a link to update each Gym's information" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)

      visit "/gyms"

      within("#gym-#{gym_2.id}") do
        expect(page).to have_link("Update Gym")

        click_link "Update Gym"

        expect(current_path).to eq("/gyms/#{gym_2.id}/edit")
      end

      visit "/gyms"

      within("#gym-#{gym_1.id}") do
        expect(page).to have_link("Update Gym")

        click_link "Update Gym"

        expect(current_path).to eq("/gyms/#{gym_1.id}/edit")
      end
    end
  end

  describe "User Story 22, Parent Delete from Parent Index" do
    # User Story 22, Parent Delete From Parent Index Page
    #
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent
    it "can delete a Gym and its rope routes" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
      rope_3 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
      rope_4 = gym_2.rope_routes.create!(grade: '5.8', color: 'White', top_rope: true, lead: true, height: 38)

      visit "/gyms"

      expect(page).to have_content(gym_1.name)

      within("#gym-#{gym_1.id}") do
        click_link "Delete Gym"
      end

      expect(current_path).to eq("/gyms")
      expect(page).to_not have_content(gym_1.name)
    end
  end
end
