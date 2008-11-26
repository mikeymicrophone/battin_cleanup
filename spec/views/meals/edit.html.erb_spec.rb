require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meals/edit.html.erb" do
  include MealsHelper
  
  before(:each) do
    assigns[:meal] = @meal = stub_model(Meal,
      :new_record? => false,
      :capacity => "1"
    )
  end

  it "should render edit form" do
    render "/meals/edit.html.erb"
    
    response.should have_tag("form[action=#{meal_path(@meal)}][method=post]") do
      with_tag('input#meal_capacity[name=?]', "meal[capacity]")
    end
  end
end


