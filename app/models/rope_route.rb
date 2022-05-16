class RopeRoute < ApplicationRecord
  belongs_to :gym

  validates_presence_of :grade, :color, :height
  validates :top_rope, :lead, inclusion: [ true, false ]
end
