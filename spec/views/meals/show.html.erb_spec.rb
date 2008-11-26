require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meals/show.html.erb" do
  include MealsHelper
  
  before(:each) do
    assigns[:meal] = @meal = stub_model(Meal,
      :capacity => "1"
    )
  end

  it "should render attributes in <p>" do
    render "/meals/show.html.erb"
    response.should have_text(/1/)
  end
end

