require "rails_helper"

RSpec.describe Gym, type: :model do

  describe "relationship" do

    it { should have_many :rope_routes}
  end

  describe "Table validations" do

    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should allow_value(true).for(:has_rope) }
    it { should allow_value(false).for(:lead) }
  end
end
