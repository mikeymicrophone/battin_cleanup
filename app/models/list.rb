class List < ActiveRecord::Base
  has_many :listings
  has_many :users, :through => :listings
  has_many :authorizations
  has_many :restaurants, :through => :authorizations
end
