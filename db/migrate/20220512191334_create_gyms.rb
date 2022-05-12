class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :location
      t.boolean :has_rope
      t.integer :square_feet

      t.timestamps
    end
  end
end
