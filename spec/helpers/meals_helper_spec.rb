require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MealsHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(MealsHelper)
  end
  
end
