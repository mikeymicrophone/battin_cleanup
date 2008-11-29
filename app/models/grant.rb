class Grant < ActiveRecord::Base
  belongs_to :user
  belongs_to :permission
  belongs_to :scope, :polymorphic => true
  
  named_scope :restaurants, :conditions => {:scope_type => 'Restaurant'}
  named_scope :lists, :conditions => {:scope_type => 'List'}
  named_scope :managed, :conditions => {:permission_id => Permission.to(:manage)}
end
