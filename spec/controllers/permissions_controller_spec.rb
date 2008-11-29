require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PermissionsController do

  def mock_permission(stubs={})
    @mock_permission ||= mock_model(Permission, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all permissions as @permissions" do
      Permission.should_receive(:find).with(:all).and_return([mock_permission])
      get :index
      assigns[:permissions].should == [mock_permission]
    end

    describe "with mime type of xml" do
  
      it "should render all permissions as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Permission.should_receive(:find).with(:all).and_return(permissions = mock("Array of Permissions"))
        permissions.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested permission as @permission" do
      Permission.should_receive(:find).with("37").and_return(mock_permission)
      get :show, :id => "37"
      assigns[:permission].should equal(mock_permission)
    end
    
    describe "with mime type of xml" do

      it "should render the requested permission as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Permission.should_receive(:find).with("37").and_return(mock_permission)
        mock_permission.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new permission as @permission" do
      Permission.should_receive(:new).and_return(mock_permission)
      get :new
      assigns[:permission].should equal(mock_permission)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested permission as @permission" do
      Permission.should_receive(:find).with("37").and_return(mock_permission)
      get :edit, :id => "37"
      assigns[:permission].should equal(mock_permission)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created permission as @permission" do
        Permission.should_receive(:new).with({'these' => 'params'}).and_return(mock_permission(:save => true))
        post :create, :permission => {:these => 'params'}
        assigns(:permission).should equal(mock_permission)
      end

      it "should redirect to the created permission" do
        Permission.stub!(:new).and_return(mock_permission(:save => true))
        post :create, :permission => {}
        response.should redirect_to(permission_url(mock_permission))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved permission as @permission" do
        Permission.stub!(:new).with({'these' => 'params'}).and_return(mock_permission(:save => false))
        post :create, :permission => {:these => 'params'}
        assigns(:permission).should equal(mock_permission)
      end

      it "should re-render the 'new' template" do
        Permission.stub!(:new).and_return(mock_permission(:save => false))
        post :create, :permission => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested permission" do
        Permission.should_receive(:find).with("37").and_return(mock_permission)
        mock_permission.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :permission => {:these => 'params'}
      end

      it "should expose the requested permission as @permission" do
        Permission.stub!(:find).and_return(mock_permission(:update_attributes => true))
        put :update, :id => "1"
        assigns(:permission).should equal(mock_permission)
      end

      it "should redirect to the permission" do
        Permission.stub!(:find).and_return(mock_permission(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(permission_url(mock_permission))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested permission" do
        Permission.should_receive(:find).with("37").and_return(mock_permission)
        mock_permission.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :permission => {:these => 'params'}
      end

      it "should expose the permission as @permission" do
        Permission.stub!(:find).and_return(mock_permission(:update_attributes => false))
        put :update, :id => "1"
        assigns(:permission).should equal(mock_permission)
      end

      it "should re-render the 'edit' template" do
        Permission.stub!(:find).and_return(mock_permission(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested permission" do
      Permission.should_receive(:find).with("37").and_return(mock_permission)
      mock_permission.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the permissions list" do
      Permission.stub!(:find).and_return(mock_permission(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(permissions_url)
    end

  end

end
