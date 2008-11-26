class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :user_id
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
