require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BansController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "bans", :action => "index").should == "/bans"
    end
  
    it "should map #new" do
      route_for(:controller => "bans", :action => "new").should == "/bans/new"
    end
  
    it "should map #show" do
      route_for(:controller => "bans", :action => "show", :id => 1).should == "/bans/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "bans", :action => "edit", :id => 1).should == "/bans/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "bans", :action => "update", :id => 1).should == "/bans/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "bans", :action => "destroy", :id => 1).should == "/bans/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/bans").should == {:controller => "bans", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/bans/new").should == {:controller => "bans", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/bans").should == {:controller => "bans", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/bans/1").should == {:controller => "bans", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/bans/1/edit").should == {:controller => "bans", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/bans/1").should == {:controller => "bans", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/bans/1").should == {:controller => "bans", :action => "destroy", :id => "1"}
    end
  end
end
