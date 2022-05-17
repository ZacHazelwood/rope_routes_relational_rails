require 'rails_helper'

RSpec.describe 'rope_routes#index', type: :feature do

  # User Story 3, Child Index
  #
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it "displays rope routes and their attributes" do
    gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
    rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)

    visit '/rope_routes'

    expect(page).to have_content(rope_1.id)
    expect(page).to have_content(rope_1.grade)
    expect(page).to have_content(rope_1.color)
    expect(page).to have_content(rope_1.top_rope)
    expect(page).to have_content(rope_1.lead)
    expect(page).to have_content(rope_1.height)
    expect(page).to have_content(rope_1.created_at)
    expect(page).to have_content(rope_1.updated_at)
  end

  describe "User Story 15, Child index shows only 'true' records" do
    # User Story 15, Child Index only shows `true` Records
    #
    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
    it "only shows rope routes that can be top-roped" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)

      visit '/rope_routes'

      expect(page).to have_content(rope_1.grade)
      expect(page).to_not have_content(rope_2.grade)
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

      visit "/rope_routes"

      within "#rope_route-#{rope_1.id}" do
        expect(page).to have_link("Update Rope Route")

        click_link "Update Rope Route"

        expect(current_path).to eq("/rope_routes/#{rope_1.id}/edit")
      end
    end
  end
end
