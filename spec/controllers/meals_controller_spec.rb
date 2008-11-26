require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MealsController do

  def mock_meal(stubs={})
    @mock_meal ||= mock_model(Meal, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all meals as @meals" do
      Meal.should_receive(:find).with(:all).and_return([mock_meal])
      get :index
      assigns[:meals].should == [mock_meal]
    end

    describe "with mime type of xml" do
  
      it "should render all meals as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Meal.should_receive(:find).with(:all).and_return(meals = mock("Array of Meals"))
        meals.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested meal as @meal" do
      Meal.should_receive(:find).with("37").and_return(mock_meal)
      get :show, :id => "37"
      assigns[:meal].should equal(mock_meal)
    end
    
    describe "with mime type of xml" do

      it "should render the requested meal as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Meal.should_receive(:find).with("37").and_return(mock_meal)
        mock_meal.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new meal as @meal" do
      Meal.should_receive(:new).and_return(mock_meal)
      get :new
      assigns[:meal].should equal(mock_meal)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested meal as @meal" do
      Meal.should_receive(:find).with("37").and_return(mock_meal)
      get :edit, :id => "37"
      assigns[:meal].should equal(mock_meal)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created meal as @meal" do
        Meal.should_receive(:new).with({'these' => 'params'}).and_return(mock_meal(:save => true))
        post :create, :meal => {:these => 'params'}
        assigns(:meal).should equal(mock_meal)
      end

      it "should redirect to the created meal" do
        Meal.stub!(:new).and_return(mock_meal(:save => true))
        post :create, :meal => {}
        response.should redirect_to(meal_url(mock_meal))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved meal as @meal" do
        Meal.stub!(:new).with({'these' => 'params'}).and_return(mock_meal(:save => false))
        post :create, :meal => {:these => 'params'}
        assigns(:meal).should equal(mock_meal)
      end

      it "should re-render the 'new' template" do
        Meal.stub!(:new).and_return(mock_meal(:save => false))
        post :create, :meal => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested meal" do
        Meal.should_receive(:find).with("37").and_return(mock_meal)
        mock_meal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :meal => {:these => 'params'}
      end

      it "should expose the requested meal as @meal" do
        Meal.stub!(:find).and_return(mock_meal(:update_attributes => true))
        put :update, :id => "1"
        assigns(:meal).should equal(mock_meal)
      end

      it "should redirect to the meal" do
        Meal.stub!(:find).and_return(mock_meal(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(meal_url(mock_meal))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested meal" do
        Meal.should_receive(:find).with("37").and_return(mock_meal)
        mock_meal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :meal => {:these => 'params'}
      end

      it "should expose the meal as @meal" do
        Meal.stub!(:find).and_return(mock_meal(:update_attributes => false))
        put :update, :id => "1"
        assigns(:meal).should equal(mock_meal)
      end

      it "should re-render the 'edit' template" do
        Meal.stub!(:find).and_return(mock_meal(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested meal" do
      Meal.should_receive(:find).with("37").and_return(mock_meal)
      mock_meal.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the meals list" do
      Meal.stub!(:find).and_return(mock_meal(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(meals_url)
    end

  end

end
