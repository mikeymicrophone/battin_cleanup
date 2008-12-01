class Permission < ActiveRecord::Base
  has_many :grants
  has_many :users, :through => :grants
  
  def self.to action
    if permission = find_by_name(action.to_s)
      permission.id
    else
      permission = create(:name => action.to_s)
      permission.id
    end
  end
end
