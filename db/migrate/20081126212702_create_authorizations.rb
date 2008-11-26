class CreateAuthorizations < ActiveRecord::Migration
  def self.up
    create_table :authorizations do |t|
      t.integer :list_id
      t.integer :restaurant_id

      t.timestamps
    end
  end

  def self.down
    drop_table :authorizations
  end
end
