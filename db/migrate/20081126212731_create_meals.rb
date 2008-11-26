class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.integer :restaurant_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :meals
  end
end
