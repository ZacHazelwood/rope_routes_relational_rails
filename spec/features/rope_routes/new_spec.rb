require 'rails_helper'

RSpec.describe "RopeRoute#new" do
  describe "User Story 13, Parent Child Creation" do
    # User Story 13, Parent Child Creation
    #
    # As a visitor
    # When I visit a Parent Childs Index page
    # Then I see a link to add a new adoptable child for that parent "Create Child"
    # When I click the link
    # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
    # When I fill in the form with the child's attributes:
    # And I click the button "Create Child"
    # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
    # a new child object/row is created for that parent,
    # and I am redirected to the Parent Childs Index page where I can see the new child listed
    it "has a link to create a new rope route for a gym" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)

      visit "/gyms/#{gym_1.id}/rope_routes"

      expect(page).to have_link("Add Rope Route")

      click_link "Add Rope Route"

      expect(current_path).to eq("/gyms/#{gym_1.id}/rope_routes/new")
    end

    it "can create a new rope route for a gym" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)

      visit "/gyms/#{gym_1.id}/rope_routes"

      expect(page).to_not have_content("5.10c")

      visit "/gyms/#{gym_1.id}/rope_routes/new"

      fill_in(:grade, with: "5.10c")
      fill_in(:color, with: "Black")
      # fill_in(:top_rope, with: true)
      # fill_in(:lead, with: true)
      select("true", from: :top_rope)
      select("true", from: :lead)
      fill_in(:height, with: 40)
      click_button("Add Rope Route")

      expect(current_path).to eq("/gyms/#{gym_1.id}/rope_routes")
      expect(page).to have_content("5.10c")
    end
  end
end
