require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meals/new.html.erb" do
  include MealsHelper
  
  before(:each) do
    assigns[:meal] = stub_model(Meal,
      :new_record? => true,
      :capacity => "1"
    )
  end

  it "should render new form" do
    render "/meals/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", meals_path) do
      with_tag("input#meal_capacity[name=?]", "meal[capacity]")
    end
  end
end


