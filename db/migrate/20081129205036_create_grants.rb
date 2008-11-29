class CreateGrants < ActiveRecord::Migration
  def self.up
    create_table :grants do |t|
      t.integer :permission_id
      t.integer :user_id
      t.string :scope_type
      t.integer :scope_id

      t.timestamps
    end
  end

  def self.down
    drop_table :grants
  end
end
