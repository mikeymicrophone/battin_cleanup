class User < ActiveRecord::Base
  has_many :restaurants
  has_many :listings
  has_many :lists, :through => :listings
  has_many :bans
  has_many :banned_restaurants, :through => :bans, :class_name => 'Restaurant', :foreign_key => :restaurant_id
  
  def name
    if first_name.blank?
      if last_name.blank?
        'John Doe'
      else
        last_name
      end
    elsif last_name.blank?
      first_name
    else
      first_name + ' ' + last_name
    end
  end
  
  def authorizations
    lists.map(&:authorizations)
  end
  
  def eateries
    authorizations.map(&:restaurant).flatten
  end
  
  def approved_eateries
    eateries - banned_restaurants
  end
  
  def is_banned_from? restaurant
    restaurant = restaurant.id if restaurant.is_a? ActiveRecord::Base
    Ban.find_by_user_id_and_restaurant_id(id, restaurant)
  end
end
