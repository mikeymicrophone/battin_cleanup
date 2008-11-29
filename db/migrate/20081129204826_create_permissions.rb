class Permission < ActiveRecord::Base
end
class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.string :name

      t.timestamps
    end
    
    Permission.create(:name => 'manage')
  end

  def self.down
    drop_table :permissions
  end
  
end
