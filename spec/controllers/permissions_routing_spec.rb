require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PermissionsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "permissions", :action => "index").should == "/permissions"
    end
  
    it "should map #new" do
      route_for(:controller => "permissions", :action => "new").should == "/permissions/new"
    end
  
    it "should map #show" do
      route_for(:controller => "permissions", :action => "show", :id => 1).should == "/permissions/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "permissions", :action => "edit", :id => 1).should == "/permissions/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "permissions", :action => "update", :id => 1).should == "/permissions/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "permissions", :action => "destroy", :id => 1).should == "/permissions/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/permissions").should == {:controller => "permissions", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/permissions/new").should == {:controller => "permissions", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/permissions").should == {:controller => "permissions", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/permissions/1").should == {:controller => "permissions", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/permissions/1/edit").should == {:controller => "permissions", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/permissions/1").should == {:controller => "permissions", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/permissions/1").should == {:controller => "permissions", :action => "destroy", :id => "1"}
    end
  end
end
