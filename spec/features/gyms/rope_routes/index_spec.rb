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

  describe "User Story 16, Parent's Children sorted Aplhabetically by Color" do
    # User Story 16, Sort Parent's Children in Alphabetical Order by name
    #
    # As a visitor
    # When I visit the Parent's children Index Page
    # Then I see a link to sort children in alphabetical order
    # When I click on the link
    # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    it "sorts the Children alphabetically by Color" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)

      visit "/gyms/#{gym_1.id}/rope_routes"

      expect(rope_1.color).to appear_before(rope_2.color)
      expect(page).to have_link("Sort Rope Routes by Color")

      click_link "Sort Rope Routes by Color"

      expect(rope_2.color).to appear_before(rope_1.color)
    end
  end

  describe "User Story 18, Child Update from Child Index page" do
    # User Story 18, Child Update From Childs Index Page
    #
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
    it "has a link to edit a rope route's information" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)

      visit "/gyms/#{gym_1.id}/rope_routes"

      within "#rope_route-#{rope_1.id}" do
        expect(page).to have_link("Update Rope Route")

        click_link "Update Rope Route"

        expect(current_path).to eq("/rope_routes/#{rope_1.id}/edit")
      end
    end
  end
end
