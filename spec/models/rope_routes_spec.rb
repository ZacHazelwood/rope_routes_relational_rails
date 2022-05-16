require 'rails_helper'

RSpec.describe RopeRoute, type: :model do
  describe "Table and relationship validation" do
    describe "relationship" do

      xit { should belong_to :gym }
    end

    describe "Table validations" do

      xit { should validate_presence_of :grade }
      xit { should validate_presence_of :color }
      xit { should validate_presence_of :height }
      xit { should allow_value(true).for(:top_rope) }
      xit { should allow_value(false).for(:top_rope) }
      xit { should allow_value(true).for(:lead) }
      xit { should allow_value(false).for(:lead) }
    end
  end
end
