require 'rails_helper'

RSpec.describe "New Gym Creation", type: :feature do
  describe "User Story 11" do
    # User Story 11, Parent Creation

    # As a visitor
    # When I visit the Parent Index page
    # Then I see a link to create a new Parent record, "New Parent"
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.
    it "displays a link to create a new Gym" do
      gym_1 = gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      visit "/gyms"

      expect(page).to have_content("New Gym")

      click_link("New Gym")

      expect(current_path).to eq("/gyms/new")
    end

    it "can create a Gym using a form" do
        visit "/gyms/new"

        fill_in(:name, with: "Movement RiNo")
        fill_in(:location, with: "Denver, CO")
        fill_in(:has_rope, with: false)

        click_button("Create Gym")

        expect(current_path).to eq("/gym")
        expect(page).to have_content("Movement RiNo")
        expect(page).to_not have_content("The Spot")
    end
  end
end
