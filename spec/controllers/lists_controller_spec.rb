require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListsController do

  def mock_list(stubs={})
    @mock_list ||= mock_model(List, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all lists as @lists" do
      List.should_receive(:find).with(:all).and_return([mock_list])
      get :index
      assigns[:lists].should == [mock_list]
    end

    describe "with mime type of xml" do
  
      it "should render all lists as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        List.should_receive(:find).with(:all).and_return(lists = mock("Array of Lists"))
        lists.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested list as @list" do
      List.should_receive(:find).with("37").and_return(mock_list)
      get :show, :id => "37"
      assigns[:list].should equal(mock_list)
    end
    
    describe "with mime type of xml" do

      it "should render the requested list as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        List.should_receive(:find).with("37").and_return(mock_list)
        mock_list.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new list as @list" do
      List.should_receive(:new).and_return(mock_list)
      get :new
      assigns[:list].should equal(mock_list)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested list as @list" do
      List.should_receive(:find).with("37").and_return(mock_list)
      get :edit, :id => "37"
      assigns[:list].should equal(mock_list)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created list as @list" do
        List.should_receive(:new).with({'these' => 'params'}).and_return(mock_list(:save => true))
        post :create, :list => {:these => 'params'}
        assigns(:list).should equal(mock_list)
      end

      it "should redirect to the created list" do
        List.stub!(:new).and_return(mock_list(:save => true))
        post :create, :list => {}
        response.should redirect_to(list_url(mock_list))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved list as @list" do
        List.stub!(:new).with({'these' => 'params'}).and_return(mock_list(:save => false))
        post :create, :list => {:these => 'params'}
        assigns(:list).should equal(mock_list)
      end

      it "should re-render the 'new' template" do
        List.stub!(:new).and_return(mock_list(:save => false))
        post :create, :list => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested list" do
        List.should_receive(:find).with("37").and_return(mock_list)
        mock_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :list => {:these => 'params'}
      end

      it "should expose the requested list as @list" do
        List.stub!(:find).and_return(mock_list(:update_attributes => true))
        put :update, :id => "1"
        assigns(:list).should equal(mock_list)
      end

      it "should redirect to the list" do
        List.stub!(:find).and_return(mock_list(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(list_url(mock_list))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested list" do
        List.should_receive(:find).with("37").and_return(mock_list)
        mock_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :list => {:these => 'params'}
      end

      it "should expose the list as @list" do
        List.stub!(:find).and_return(mock_list(:update_attributes => false))
        put :update, :id => "1"
        assigns(:list).should equal(mock_list)
      end

      it "should re-render the 'edit' template" do
        List.stub!(:find).and_return(mock_list(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested list" do
      List.should_receive(:find).with("37").and_return(mock_list)
      mock_list.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the lists list" do
      List.stub!(:find).and_return(mock_list(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(lists_url)
    end

  end

end
