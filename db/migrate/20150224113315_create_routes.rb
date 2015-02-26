class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :timestamp
      t.string :name
      t.integer :velocity
      t.integer :length
      t.integer :traveltime

      t.timestamps null: false
    end
  end
end
