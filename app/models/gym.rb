class Gym < ApplicationRecord
  has_many :rope_routes

  validates_presence_of :name, :location, :square_feet
  validates :has_rope, inclusion: [true, false]

  def self.order_by_creation
    order(created_at: :desc)
  end

  def count_routes
    rope_routes.count
  end
end
