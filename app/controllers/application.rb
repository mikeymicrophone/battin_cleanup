# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :user_from_session

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '31529139c92959bb6d3f69c49556499e'
  attr_accessor :current_user
  helper_method :current_user

  def logged_in?
    current_user
  end
  
  def user_from_session
    self.current_user = session[:user]
  end
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end

class ActiveRecord::Base
  def self.map_name_and_id
    all.map { |a| [a.name, a.id] }
  end
end

class Array
  def map_name_and_id
    map { |a| [a.name, a.id] }
  end
end