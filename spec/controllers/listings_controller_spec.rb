require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListingsController do

  def mock_listing(stubs={})
    @mock_listing ||= mock_model(Listing, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all listings as @listings" do
      Listing.should_receive(:find).with(:all).and_return([mock_listing])
      get :index
      assigns[:listings].should == [mock_listing]
    end

    describe "with mime type of xml" do
  
      it "should render all listings as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Listing.should_receive(:find).with(:all).and_return(listings = mock("Array of Listings"))
        listings.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested listing as @listing" do
      Listing.should_receive(:find).with("37").and_return(mock_listing)
      get :show, :id => "37"
      assigns[:listing].should equal(mock_listing)
    end
    
    describe "with mime type of xml" do

      it "should render the requested listing as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Listing.should_receive(:find).with("37").and_return(mock_listing)
        mock_listing.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new listing as @listing" do
      Listing.should_receive(:new).and_return(mock_listing)
      get :new
      assigns[:listing].should equal(mock_listing)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested listing as @listing" do
      Listing.should_receive(:find).with("37").and_return(mock_listing)
      get :edit, :id => "37"
      assigns[:listing].should equal(mock_listing)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created listing as @listing" do
        Listing.should_receive(:new).with({'these' => 'params'}).and_return(mock_listing(:save => true))
        post :create, :listing => {:these => 'params'}
        assigns(:listing).should equal(mock_listing)
      end

      it "should redirect to the created listing" do
        Listing.stub!(:new).and_return(mock_listing(:save => true))
        post :create, :listing => {}
        response.should redirect_to(listing_url(mock_listing))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved listing as @listing" do
        Listing.stub!(:new).with({'these' => 'params'}).and_return(mock_listing(:save => false))
        post :create, :listing => {:these => 'params'}
        assigns(:listing).should equal(mock_listing)
      end

      it "should re-render the 'new' template" do
        Listing.stub!(:new).and_return(mock_listing(:save => false))
        post :create, :listing => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested listing" do
        Listing.should_receive(:find).with("37").and_return(mock_listing)
        mock_listing.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :listing => {:these => 'params'}
      end

      it "should expose the requested listing as @listing" do
        Listing.stub!(:find).and_return(mock_listing(:update_attributes => true))
        put :update, :id => "1"
        assigns(:listing).should equal(mock_listing)
      end

      it "should redirect to the listing" do
        Listing.stub!(:find).and_return(mock_listing(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(listing_url(mock_listing))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested listing" do
        Listing.should_receive(:find).with("37").and_return(mock_listing)
        mock_listing.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :listing => {:these => 'params'}
      end

      it "should expose the listing as @listing" do
        Listing.stub!(:find).and_return(mock_listing(:update_attributes => false))
        put :update, :id => "1"
        assigns(:listing).should equal(mock_listing)
      end

      it "should re-render the 'edit' template" do
        Listing.stub!(:find).and_return(mock_listing(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested listing" do
      Listing.should_receive(:find).with("37").and_return(mock_listing)
      mock_listing.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the listings list" do
      Listing.stub!(:find).and_return(mock_listing(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(listings_url)
    end

  end

end
