require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lists/new.html.erb" do
  include ListsHelper
  
  before(:each) do
    assigns[:list] = stub_model(List,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/lists/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", lists_path) do
      with_tag("input#list_name[name=?]", "list[name]")
    end
  end
end


