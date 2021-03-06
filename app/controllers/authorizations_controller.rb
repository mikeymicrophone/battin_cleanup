class AuthorizationsController < ApplicationController
  # GET /authorizations
  # GET /authorizations.xml
  def index
    @authorizations = if params[:list_id]
      List.find(params[:list_id]).authorizations
    else
      Authorization.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authorizations }
    end
  end

  # GET /authorizations/1
  # GET /authorizations/1.xml
  def show
    @authorization = Authorization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @authorization }
    end
  end

  # GET /authorizations/new
  # GET /authorizations/new.xml
  def new
    @authorization = Authorization.new
    
    @lists = current_user.managed_lists.map_name_and_id
    @restaurants = current_user.managed_restaurants.map_name_and_id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @authorization }
    end
  end

  # GET /authorizations/1/edit
  def edit
    @authorization = Authorization.find(params[:id])
  end

  # POST /authorizations
  # POST /authorizations.xml
  def create
    @authorization = Authorization.new(params[:authorization])
    
    redirect_to @authorization.restaurant && return unless current_user && current_user.has_permission_to?(:manage, @authorization.restaurant)

    respond_to do |format|
      if @authorization.save
        flash[:notice] = 'Authorization was successfully created.'
        format.html { redirect_to(@authorization) }
        format.xml  { render :xml => @authorization, :status => :created, :location => @authorization }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @authorization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /authorizations/1
  # PUT /authorizations/1.xml
  def update
    @authorization = Authorization.find(params[:id])
    redirect_to @authorization.restaurant && return unless current_user && current_user.has_permission_to?(:manage, @authorization.restaurant)

    respond_to do |format|
      if @authorization.update_attributes(params[:authorization])
        flash[:notice] = 'Authorization was successfully updated.'
        format.html { redirect_to(@authorization) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @authorization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /authorizations/1
  # DELETE /authorizations/1.xml
  def destroy
    @authorization = Authorization.find(params[:id])
    redirect_to @authorization.restaurant && return unless current_user && current_user.has_permission_to?(:manage, @authorization.restaurant)
    @authorization.destroy

    respond_to do |format|
      format.html { redirect_to(authorizations_url) }
      format.xml  { head :ok }
    end
  end
end
