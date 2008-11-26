class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :user_id
      t.integer :list_id

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
