class Permission < ActiveRecord::Base
  has_many :grants
  has_many :users, :through => :grants
  
  def self.to action
    permission = find_by_name(action.to_s)
    permission.id if permission
  end
end
