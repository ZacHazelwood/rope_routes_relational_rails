class RopeRoute < ApplicationRecord
  belongs_to :gym

  validates_presence_of :grade, :color, :height
  validates :top_rope, :lead, inclusion: [ true, false ]

  def self.has_top_rope
    where(top_rope: true)
  end

  def self.color_order(sort = nil, filter = nil)
    if sort == "Alphabetical"
      RopeRoute.order(:color)
    elsif sort == "Filter"
      RopeRoute.where(["height > ?", filter])
    else
      RopeRoute.all
    end
  end
end
