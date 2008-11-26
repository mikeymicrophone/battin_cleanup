require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/edit.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
      :first_name => "value for first_name",
      :middle_name => "value for middle_name",
      :last_name => "value for last_name",
      :email => "value for email",
      :phone => "value for phone",
      :address => "value for address",
      :address2 => "value for address2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip",
      :password => "value for password"
    )
  end

  it "should render edit form" do
    render "/users/edit.html.erb"
    
    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_first_name[name=?]', "user[first_name]")
      with_tag('input#user_middle_name[name=?]', "user[middle_name]")
      with_tag('input#user_last_name[name=?]', "user[last_name]")
      with_tag('input#user_email[name=?]', "user[email]")
      with_tag('input#user_phone[name=?]', "user[phone]")
      with_tag('input#user_address[name=?]', "user[address]")
      with_tag('input#user_address2[name=?]', "user[address2]")
      with_tag('input#user_city[name=?]', "user[city]")
      with_tag('input#user_state[name=?]', "user[state]")
      with_tag('input#user_zip[name=?]', "user[zip]")
      with_tag('input#user_password[name=?]', "user[password]")
    end
  end
end


