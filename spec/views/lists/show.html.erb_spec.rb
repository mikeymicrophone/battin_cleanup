require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lists/show.html.erb" do
  include ListsHelper
  
  before(:each) do
    assigns[:list] = @list = stub_model(List,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/lists/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

