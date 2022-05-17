require 'rails_helper'

RSpec.describe "rope_routes#edit, rope_routes#edit" do
  describe "User Story 14, Child Update" do
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:

    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information

    it "has a link to the child edit page" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)

      visit "/rope_routes/#{rope_1.id}"

      expect(page).to have_link("Update Rope Route")

      click_link "Update Rope Route"

      expect(current_path).to eq("/rope_routes/#{rope_1.id}/edit")
    end

    it "can update the rope route" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)

      visit "/rope_routes/#{rope_1.id}"

      expect(page).to have_content("5.9")
      expect(page).to_not have_content("White")

      visit "/rope_routes/#{rope_1.id}/edit"

      fill_in(:grade, with: "5.9")
      fill_in(:color, with: "White")
      # fill_in(:top_rope, with: true)
      # fill_in(:lead, with: false)
      select("true", from: :top_rope)
      select("false", from: :lead)
      fill_in(:height, with: 33)
      click_button("Update Rope Route")

      expect(current_path).to eq("/rope_routes/#{rope_1.id}")
      expect(page).to have_content("White")
      expect(page).to_not have_content("Green")
    end
  end
end
