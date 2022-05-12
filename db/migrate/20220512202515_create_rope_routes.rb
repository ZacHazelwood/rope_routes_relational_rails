class CreateRopeRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :rope_routes do |t|
      t.string :grade
      t.string :color
      t.boolean :top_rope
      t.boolean :lead
      t.integer :height

      t.timestamps
    end
  end
end
