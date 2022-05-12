require 'rails_helper'

RSpec.describe 'rope_routes#show', type: :feature do

  # User Story 4, Child Show
  #
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  it 'displays a rope route from an ID and displays attributes' do
    gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
    gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
    rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
    rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
    rope_3 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
    rope_4 = gym_2.rope_routes.create!(grade: '5.11', color: 'White', top_rope: true, lead: true, height: 38)

    visit "/rope_routes/#{rope_1.id}"
    save_and_open_page

    expect(page).to have_content(rope_1.id)
    expect(page).to have_content(rope_1.grade)
    expect(page).to have_content(rope_1.color)
    expect(page).to have_content(rope_1.top_rope)
    expect(page).to have_content(rope_1.lead)
    expect(page).to have_content(rope_1.height)
    expect(page).to have_content(rope_1.created_at)
    expect(page).to have_content(rope_1.updated_at)

    expect(page).to_not have_content(rope_2.grade)
    expect(page).to_not have_content(rope_3.grade)
    expect(page).to_not have_content(rope_4.grade)
  end
end
