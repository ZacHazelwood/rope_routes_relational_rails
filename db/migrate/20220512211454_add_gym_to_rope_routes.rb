class AddGymToRopeRoutes < ActiveRecord::Migration[5.2]
  def change
    add_reference :rope_routes, :gym, foreign_key: true
  end
end
