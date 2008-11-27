class Authorization < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :list
  
  def listings
    list.listings
  end
  
  def users
    listings.map(&:user)
  end
  
  def approved_users
    users - restaurant.banned_users
  end
end
