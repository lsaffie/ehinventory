class HardwareTypesController < ApplicationController
  # GET /hardware_types
  # GET /hardware_types.xml
  def index
    @hardware_types = HardwareType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hardware_types }
      format.js { render :layout => false }
    end
  end

  # GET /hardware_types/1
  # GET /hardware_types/1.xml
  def show
    @hardware_type = HardwareType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hardware_type }
    end
  end

  # GET /hardware_types/new
  # GET /hardware_types/new.xml
  def new
    @hardware_type = HardwareType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hardware_type }
    end
  end

  # GET /hardware_types/1/edit
  def edit
    @hardware_type = HardwareType.find(params[:id])
  end

  # POST /hardware_types
  # POST /hardware_types.xml
  def create
    @hardware_type = HardwareType.new(params[:hardware_type])

    respond_to do |format|
      if @hardware_type.save
        flash[:notice] = 'HardwareType was successfully created.'
        format.html { redirect_to(@hardware_type) }
        format.xml  { render :xml => @hardware_type, :status => :created, :location => @hardware_type }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hardware_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hardware_types/1
  # PUT /hardware_types/1.xml
  def update
    @hardware_type = HardwareType.find(params[:id])

    respond_to do |format|
      if @hardware_type.update_attributes(params[:hardware_type])
        flash[:notice] = 'HardwareType was successfully updated.'
        format.html { redirect_to(@hardware_type) }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hardware_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hardware_types/1
  # DELETE /hardware_types/1.xml
  def destroy
    @hardware_type = HardwareType.find(params[:id])
    @hardware_type.destroy

    respond_to do |format|
      format.html { redirect_to(hardware_types_url) }
      format.xml  { head :ok }
      format.js do
        render :update do |page|
          page.remove "hardware_type_#{@hardware_type.id}"
        end
      end
    end
  end
end
