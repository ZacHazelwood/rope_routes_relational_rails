require 'rails_helper'

RSpec.describe RopeRoute, type: :model do
  describe "Table and relationship validation" do
    describe "relationship" do

      it { should belong_to :gym }
    end

    describe "Table validations" do

      it { should validate_presence_of :grade }
      it { should validate_presence_of :color }
      it { should validate_presence_of :height }
      it { should allow_value(true).for(:top_rope) }
      it { should allow_value(false).for(:top_rope) }
      it { should allow_value(true).for(:lead) }
      it { should allow_value(false).for(:lead) }
    end
  end

  describe "class methods" do
    it "can shows only rope routes with top rope 'true'" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
      rope_3 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
      rope_4 = gym_2.rope_routes.create!(grade: '5.8', color: 'White', top_rope: true, lead: true, height: 38)

      expect(RopeRoute.has_top_rope).to eq([rope_1, rope_3, rope_4])
    end

    it "sorts Rope Routes Aplhabetically from the color field" do
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      rope_1 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
      rope_2 = gym_2.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_3 = gym_2.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
      rope_4 = gym_2.rope_routes.create!(grade: '5.8', color: 'White', top_rope: true, lead: true, height: 38)

      expect(gym_2.rope_routes.color_order("Generic search")).to eq([rope_1, rope_2, rope_3, rope_4])
      expect(gym_2.rope_routes.color_order("Alphabetical")).to eq([rope_3, rope_2, rope_1, rope_4])
    end
  end
end
