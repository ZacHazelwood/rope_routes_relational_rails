require "rails_helper"

RSpec.describe Gym, type: :model do

  describe "relationship" do

    xit { should have_many :rope_routes}
  end

  describe "Table validations" do

    xit { should validate_presence_of :name }
    xit { should validate_presence_of :location }
    xit { should allow_value(true).for(:has_rope) }
    xit { should allow_value(false).for(:has_rope) }
  end
end
