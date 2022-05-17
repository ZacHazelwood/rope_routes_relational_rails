class RopeRoute < ApplicationRecord
  belongs_to :gym

  validates_presence_of :grade, :color, :height
  validates :top_rope, :lead, inclusion: [ true, false ]

  def self.has_top_rope
    where(top_rope: true)
  end
end
