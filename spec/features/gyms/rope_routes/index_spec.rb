require 'rails_helper'

RSpec.describe "Parent-Child index", type: :feature do

  # User Story 5, Parent Children Index
  #
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  it "associates the child table to the parent ID" do
    gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
    gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
    rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
    rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
    rope_3 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
    rope_4 = gym_2.rope_routes.create!(grade: '5.8', color: 'White', top_rope: true, lead: true, height: 38)

    visit "/gyms/#{gym_1.id}/rope_routes"
    # save_and_open_page

    expect(page).to have_content(rope_1.id)
    expect(page).to have_content(rope_1.grade)
    expect(page).to have_content(rope_1.color)
    expect(page).to have_content(rope_1.top_rope)
    expect(page).to have_content(rope_1.lead)
    expect(page).to have_content(rope_1.height)
    expect(page).to have_content(rope_1.created_at)
    expect(page).to have_content(rope_1.updated_at)

    expect(page).to have_content(rope_2.id)
    expect(page).to have_content(rope_2.grade)

    expect(page).to_not have_content(rope_3.grade)
    expect(page).to_not have_content(rope_4.grade)
  end

  describe "User Story 8, Child Index Link" do
    # User Story 8, Child Index Link
    #
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    it "has a link to the Rope Routes index" do
      Gym.destroy_all
      RopeRoute.destroy_all
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
      rope_3 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
      rope_4 = gym_2.rope_routes.create!(grade: '5.8', color: 'White', top_rope: true, lead: true, height: 38)

      visit "/rope_routes"
      click_link "All Rope Routes"

      expect(current_path).to eq("/rope_routes")
    end
  end

  describe "User Story 9, Parent Index Link" do
    # User Story 9, Parent Index Link
    #
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    it "has a link to the Gyms index" do
      Gym.destroy_all
      RopeRoute.destroy_all
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
      rope_3 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
      rope_4 = gym_2.rope_routes.create!(grade: '5.8', color: 'White', top_rope: true, lead: true, height: 38)

      visit "/gyms"
      click_link "All Gyms"

      expect(current_path).to eq("/gyms")
    end
  end

  describe "User Story 12, Parent Child Creation" do
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
      fill_in(:top_rope, with: true)
      fill_in(:lead, with: true)
      fill_in(:height, with: 40)
      click_button("Add Rope Route")

      expect(current_path).to eq("/gyms/#{gym_1.id}/rope_routes")
      expect(page).to have_content("5.10c")
    end
  end
end
