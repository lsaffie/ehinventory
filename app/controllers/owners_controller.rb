class OwnersController < ApplicationController
  # GET /owners
  # GET /owners.xml
  def index
    @owners = Owner.find(:all, :order => "group_id, name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @owners }
      format.js { render :layout => false }
    end
  end

  # GET /owners/1
  # GET /owners/1.xml
  def show
    @owner = Owner.find(params[:id])
    @hardwares = @owner.hardwares

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @owner }
    end
  end

  # GET /owners/new
  # GET /owners/new.xml
  def new
    @owner = Owner.new
    @groups = Group.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @owner }
    end
  end

  # GET /owners/1/edit
  def edit
    @owner = Owner.find(params[:id])
  end

  # POST /owners
  # POST /owners.xml
  def create
    @owner = Owner.new(params[:owner])
    @owner.group = Group.find(params[:group]["group_id"])

    respond_to do |format|
      if @owner.save
        flash[:notice] = 'Owner was successfully created.'
        format.html { redirect_to(@owner) }
        format.xml  { render :xml => @owner, :status => :created, :location => @owner }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @owner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /owners/1
  # PUT /owners/1.xml
  def update
    @owner = Owner.find(params[:id])
    @owner.group = Group.find(params[:group]["group_id"])

    respond_to do |format|
      if @owner.update_attributes(params[:owner])
        flash[:notice] = 'Owner was successfully updated.'
        format.html { redirect_to(@owner) }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @owner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.xml
  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy

    respond_to do |format|
      format.html { redirect_to(owners_url) }
      format.xml  { head :ok }
      format.js do
        render :update do |page|
          page.remove "owner_#{@owner.id}"
        end
      end
    end
  end
end
