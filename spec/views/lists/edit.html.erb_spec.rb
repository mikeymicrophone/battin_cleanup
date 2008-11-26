require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lists/edit.html.erb" do
  include ListsHelper
  
  before(:each) do
    assigns[:list] = @list = stub_model(List,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/lists/edit.html.erb"
    
    response.should have_tag("form[action=#{list_path(@list)}][method=post]") do
      with_tag('input#list_name[name=?]', "list[name]")
    end
  end
end


