require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BansController do

  def mock_ban(stubs={})
    @mock_ban ||= mock_model(Ban, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all bans as @bans" do
      Ban.should_receive(:find).with(:all).and_return([mock_ban])
      get :index
      assigns[:bans].should == [mock_ban]
    end

    describe "with mime type of xml" do
  
      it "should render all bans as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Ban.should_receive(:find).with(:all).and_return(bans = mock("Array of Bans"))
        bans.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested ban as @ban" do
      Ban.should_receive(:find).with("37").and_return(mock_ban)
      get :show, :id => "37"
      assigns[:ban].should equal(mock_ban)
    end
    
    describe "with mime type of xml" do

      it "should render the requested ban as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Ban.should_receive(:find).with("37").and_return(mock_ban)
        mock_ban.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new ban as @ban" do
      Ban.should_receive(:new).and_return(mock_ban)
      get :new
      assigns[:ban].should equal(mock_ban)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested ban as @ban" do
      Ban.should_receive(:find).with("37").and_return(mock_ban)
      get :edit, :id => "37"
      assigns[:ban].should equal(mock_ban)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created ban as @ban" do
        Ban.should_receive(:new).with({'these' => 'params'}).and_return(mock_ban(:save => true))
        post :create, :ban => {:these => 'params'}
        assigns(:ban).should equal(mock_ban)
      end

      it "should redirect to the created ban" do
        Ban.stub!(:new).and_return(mock_ban(:save => true))
        post :create, :ban => {}
        response.should redirect_to(ban_url(mock_ban))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved ban as @ban" do
        Ban.stub!(:new).with({'these' => 'params'}).and_return(mock_ban(:save => false))
        post :create, :ban => {:these => 'params'}
        assigns(:ban).should equal(mock_ban)
      end

      it "should re-render the 'new' template" do
        Ban.stub!(:new).and_return(mock_ban(:save => false))
        post :create, :ban => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested ban" do
        Ban.should_receive(:find).with("37").and_return(mock_ban)
        mock_ban.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ban => {:these => 'params'}
      end

      it "should expose the requested ban as @ban" do
        Ban.stub!(:find).and_return(mock_ban(:update_attributes => true))
        put :update, :id => "1"
        assigns(:ban).should equal(mock_ban)
      end

      it "should redirect to the ban" do
        Ban.stub!(:find).and_return(mock_ban(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(ban_url(mock_ban))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested ban" do
        Ban.should_receive(:find).with("37").and_return(mock_ban)
        mock_ban.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ban => {:these => 'params'}
      end

      it "should expose the ban as @ban" do
        Ban.stub!(:find).and_return(mock_ban(:update_attributes => false))
        put :update, :id => "1"
        assigns(:ban).should equal(mock_ban)
      end

      it "should re-render the 'edit' template" do
        Ban.stub!(:find).and_return(mock_ban(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested ban" do
      Ban.should_receive(:find).with("37").and_return(mock_ban)
      mock_ban.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the bans list" do
      Ban.stub!(:find).and_return(mock_ban(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(bans_url)
    end

  end

end
