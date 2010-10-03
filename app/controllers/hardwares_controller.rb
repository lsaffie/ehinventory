class HardwaresController < ApplicationController
  before_filter :login_required

  # GET /hardwares
  # GET /hardwares.xml
  def index
    @search = params[:search]
    @hardwares = Hardware.search(@search, params[:hardware_type])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hardwares }
      format.js { render :layout => false }
    end
  end

  # GET /hardwares/1
  # GET /hardwares/1.xml
  def show
    @hardware = Hardware.find(params[:id])
    @owners = Owner.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hardware }
      format.js
    end
  end

  # GET /hardwares/new
  # GET /hardwares/new.xml
  def new
    @hardware = Hardware.new
    @hardware_types = HardwareType.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hardware }
    end
  end

  # GET /hardwares/1/edit
  def edit
    @hardware = Hardware.find(params[:id])
  end

  # POST /hardwares
  # POST /hardwares.xml
  def create
    @hardware = Hardware.new(params[:hardware])
    @hardware.hardware_type = HardwareType.find(params[:hardware_type]["hardware_type_id"])
    @hardware.owner_id = params[:owner]['owner_id']

    respond_to do |format|
      if @hardware.save
        flash[:notice] = 'Hardware was successfully created.'
        format.html { redirect_to(@hardware) }
        format.xml  { render :xml => @hardware, :status => :created, :location => @hardware }
        format.js 
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hardwares/1
  # PUT /hardwares/1.xml
  def update
    @hardware = Hardware.find(params[:id])
    if params[:hardware_type]
      @hardware.hardware_type_id = params[:hardware_type]['hardware_type_id']
    end
    if params[:owner]
      @hardware.owner_id = params[:owner]["owner_id"]
    end
    respond_to do |format|
      if @hardware.update_attributes(params[:hardware])
        flash[:notice] = 'Hardware was successfully updated.'
        format.html { redirect_to(@hardware) }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hardwares/1
  # DELETE /hardwares/1.xml
  def destroy
    @hardware = Hardware.find(params[:id])
    if @hardware.assignments
      assignments = @hardware.assignments
      for assignment in assignments 
        Assignment.delete(assignment)
      end
    end
    @hardware.destroy

    respond_to do |format|
      format.html { redirect_to(hardwares_url) }
      format.xml  { head :ok }
      format.js do
        render :update do |page|
          page.remove "hardware_#{@hardware.id}"
        end
      end
    end
  end
end
