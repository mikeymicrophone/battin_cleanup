require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GrantsController do

  def mock_grant(stubs={})
    @mock_grant ||= mock_model(Grant, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all grants as @grants" do
      Grant.should_receive(:find).with(:all).and_return([mock_grant])
      get :index
      assigns[:grants].should == [mock_grant]
    end

    describe "with mime type of xml" do
  
      it "should render all grants as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Grant.should_receive(:find).with(:all).and_return(grants = mock("Array of Grants"))
        grants.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested grant as @grant" do
      Grant.should_receive(:find).with("37").and_return(mock_grant)
      get :show, :id => "37"
      assigns[:grant].should equal(mock_grant)
    end
    
    describe "with mime type of xml" do

      it "should render the requested grant as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Grant.should_receive(:find).with("37").and_return(mock_grant)
        mock_grant.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new grant as @grant" do
      Grant.should_receive(:new).and_return(mock_grant)
      get :new
      assigns[:grant].should equal(mock_grant)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested grant as @grant" do
      Grant.should_receive(:find).with("37").and_return(mock_grant)
      get :edit, :id => "37"
      assigns[:grant].should equal(mock_grant)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created grant as @grant" do
        Grant.should_receive(:new).with({'these' => 'params'}).and_return(mock_grant(:save => true))
        post :create, :grant => {:these => 'params'}
        assigns(:grant).should equal(mock_grant)
      end

      it "should redirect to the created grant" do
        Grant.stub!(:new).and_return(mock_grant(:save => true))
        post :create, :grant => {}
        response.should redirect_to(grant_url(mock_grant))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved grant as @grant" do
        Grant.stub!(:new).with({'these' => 'params'}).and_return(mock_grant(:save => false))
        post :create, :grant => {:these => 'params'}
        assigns(:grant).should equal(mock_grant)
      end

      it "should re-render the 'new' template" do
        Grant.stub!(:new).and_return(mock_grant(:save => false))
        post :create, :grant => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested grant" do
        Grant.should_receive(:find).with("37").and_return(mock_grant)
        mock_grant.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :grant => {:these => 'params'}
      end

      it "should expose the requested grant as @grant" do
        Grant.stub!(:find).and_return(mock_grant(:update_attributes => true))
        put :update, :id => "1"
        assigns(:grant).should equal(mock_grant)
      end

      it "should redirect to the grant" do
        Grant.stub!(:find).and_return(mock_grant(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(grant_url(mock_grant))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested grant" do
        Grant.should_receive(:find).with("37").and_return(mock_grant)
        mock_grant.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :grant => {:these => 'params'}
      end

      it "should expose the grant as @grant" do
        Grant.stub!(:find).and_return(mock_grant(:update_attributes => false))
        put :update, :id => "1"
        assigns(:grant).should equal(mock_grant)
      end

      it "should re-render the 'edit' template" do
        Grant.stub!(:find).and_return(mock_grant(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested grant" do
      Grant.should_receive(:find).with("37").and_return(mock_grant)
      mock_grant.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the grants list" do
      Grant.stub!(:find).and_return(mock_grant(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(grants_url)
    end

  end

end
