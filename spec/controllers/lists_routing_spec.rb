require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "lists", :action => "index").should == "/lists"
    end
  
    it "should map #new" do
      route_for(:controller => "lists", :action => "new").should == "/lists/new"
    end
  
    it "should map #show" do
      route_for(:controller => "lists", :action => "show", :id => 1).should == "/lists/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "lists", :action => "edit", :id => 1).should == "/lists/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "lists", :action => "update", :id => 1).should == "/lists/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "lists", :action => "destroy", :id => 1).should == "/lists/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/lists").should == {:controller => "lists", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/lists/new").should == {:controller => "lists", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/lists").should == {:controller => "lists", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/lists/1").should == {:controller => "lists", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/lists/1/edit").should == {:controller => "lists", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/lists/1").should == {:controller => "lists", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/lists/1").should == {:controller => "lists", :action => "destroy", :id => "1"}
    end
  end
end
