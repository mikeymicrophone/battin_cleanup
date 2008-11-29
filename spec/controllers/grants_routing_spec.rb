require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GrantsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "grants", :action => "index").should == "/grants"
    end
  
    it "should map #new" do
      route_for(:controller => "grants", :action => "new").should == "/grants/new"
    end
  
    it "should map #show" do
      route_for(:controller => "grants", :action => "show", :id => 1).should == "/grants/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "grants", :action => "edit", :id => 1).should == "/grants/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "grants", :action => "update", :id => 1).should == "/grants/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "grants", :action => "destroy", :id => 1).should == "/grants/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/grants").should == {:controller => "grants", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/grants/new").should == {:controller => "grants", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/grants").should == {:controller => "grants", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/grants/1").should == {:controller => "grants", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/grants/1/edit").should == {:controller => "grants", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/grants/1").should == {:controller => "grants", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/grants/1").should == {:controller => "grants", :action => "destroy", :id => "1"}
    end
  end
end
