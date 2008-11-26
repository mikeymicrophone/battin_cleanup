require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MealsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "meals", :action => "index").should == "/meals"
    end
  
    it "should map #new" do
      route_for(:controller => "meals", :action => "new").should == "/meals/new"
    end
  
    it "should map #show" do
      route_for(:controller => "meals", :action => "show", :id => 1).should == "/meals/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "meals", :action => "edit", :id => 1).should == "/meals/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "meals", :action => "update", :id => 1).should == "/meals/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "meals", :action => "destroy", :id => 1).should == "/meals/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/meals").should == {:controller => "meals", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/meals/new").should == {:controller => "meals", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/meals").should == {:controller => "meals", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/meals/1").should == {:controller => "meals", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/meals/1/edit").should == {:controller => "meals", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/meals/1").should == {:controller => "meals", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/meals/1").should == {:controller => "meals", :action => "destroy", :id => "1"}
    end
  end
end
