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
end
