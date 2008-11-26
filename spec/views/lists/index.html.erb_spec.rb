require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lists/index.html.erb" do
  include ListsHelper
  
  before(:each) do
    assigns[:lists] = [
      stub_model(List,
        :name => "value for name"
      ),
      stub_model(List,
        :name => "value for name"
      )
    ]
  end

  it "should render list of lists" do
    render "/lists/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

