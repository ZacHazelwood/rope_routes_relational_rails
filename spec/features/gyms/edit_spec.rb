require 'rails_helper'

RSpec.describe "gym#edit, Update existing Gym" do
  describe "User Story 12, Parent Update" do
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    it "has a link to edit a Gym" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)

      visit "/gyms/#{gym_1.id}"
      click_link "Update Gym"

      expect(current_path).to eq("/gyms/#{gym_1.id}/edit")
    end

    it "can update the Gym" do
      gym_1 = Gym.create!(name: "Earth Treks Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)

      visit "/gyms/#{gym_1.id}"

      expect(page).to have_content("Earth Treks Englewood")

      click_link "Update Gym"

      expect(current_path).to eq("/gyms/#{gym_1.id}/edit")

      fill_in(:name, with: "Movement Englewood")
      fill_in(:location, with: "Englewood, CO")
      fill_in(:has_rope, with: true)
      fill_in(:square_feet, with: 175000)
      click_button ("Update Gym")

      expect(current_path).to eq("/gyms/#{gym_1.id}")
      expect(page).to have_content("Movement Englewood")
      expect(page).to_not have_content("Earth Treks Englewood")
    end
  end
end
