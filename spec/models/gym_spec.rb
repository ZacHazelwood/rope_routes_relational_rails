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
end
