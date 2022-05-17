require "rails_helper"

RSpec.describe Gym, type: :model do

  describe "relationship" do

    it { should have_many :rope_routes}
  end

  describe "Table validations" do

    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should allow_value(true).for(:has_rope) }
    it { should allow_value(false).for(:has_rope) }
  end

  describe "class methods" do

    it "sorts by created time" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)

      expect(Gym.order_by_creation).to eq([gym_2, gym_1])
    end
  end

  describe "instance methods" do
    it "can count rope routes" do
      gym_1 = Gym.create!(name: "Movement Englewood", location: "Englewood, CO", has_rope: true, square_feet: 175000)
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      rope_1 = gym_1.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_2 = gym_1.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
      rope_3 = gym_1.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
      rope_4 = gym_2.rope_routes.create!(grade: '5.11', color: 'White', top_rope: true, lead: true, height: 38)

      expect(gym_1.count_routes).to eq(3)
      expect(gym_2.count_routes).to eq(1)
    end

    it "can sort via specified parameters" do
      gym_2 = Gym.create!(name: "Movement Boulder", location: "Boulder, CO", has_rope: true, square_feet: 22000)
      rope_1 = gym_2.rope_routes.create!(grade: '5.10a', color: 'White', top_rope: true, lead: true, height: 33)
      rope_2 = gym_2.rope_routes.create!(grade: '5.9', color: 'Green', top_rope: true, lead: false, height: 33)
      rope_3 = gym_2.rope_routes.create!(grade: '5.11', color: 'Blue', top_rope: false, lead: true, height: 45)
      rope_4 = gym_2.rope_routes.create!(grade: '5.8', color: 'White', top_rope: true, lead: true, height: 38)

      expect(gym_2.rope_route_order(nil)).to eq([rope_1, rope_2, rope_3, rope_4])
      expect(gym_2.rope_route_order("Generic search")).to eq([rope_1, rope_2, rope_3, rope_4])
      expect(gym_2.rope_route_order("Alphabetical")).to eq([rope_3, rope_2, rope_1, rope_4])
    end
  end
end
