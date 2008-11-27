class Restaurant < ActiveRecord::Base
  has_many :meals
  has_many :authorizations
  has_many :lists, :through => :authorizations
  has_many :bans
  has_many :banned_users, :through => :bans, :class_name => 'User', :foreign_key => :user_id
  
  def listings
    lists.map(&:listings)
  end
  
  def patrons
    listings.map(&:user).uniq
  end
  
  def allowed_patrons
    patrons - banned_users
  end
end
