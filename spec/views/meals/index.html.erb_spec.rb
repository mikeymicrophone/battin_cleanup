require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meals/index.html.erb" do
  include MealsHelper
  
  before(:each) do
    assigns[:meals] = [
      stub_model(Meal,
        :capacity => "1"
      ),
      stub_model(Meal,
        :capacity => "1"
      )
    ]
  end

  it "should render list of meals" do
    render "/meals/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
  end
end

