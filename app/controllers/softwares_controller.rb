class SoftwaresController < ApplicationController
  before_filter :login_required
  
  # GET /softwares
  # GET /softwares.xml
  def index
    @softwares = Software.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @softwares }
      format.js { render :layout => false }
    end
  end

  # GET /softwares/1
  # GET /softwares/1.xml
  def show
    @software = Software.find(params[:id])
    @ticket = Ticket.new
    @hardwares = Hardware.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @software }
      format.js { render :layout => false }
    end
  end

  # GET /softwares/new
  # GET /softwares/new.xml
  def new
    @software = Software.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @software }
    end
  end

  # GET /softwares/1/edit
  def edit
    @software = Software.find(params[:id])
  end

  # POST /softwares
  # POST /softwares.xml
  def create
    @software = Software.new(params[:software])   
    respond_to do |format|
      if @software.save
        flash[:notice] = 'Software was successfully created.'
        format.html { redirect_to(@software) }
        format.xml  { render :xml => @software, :status => :created, :location => @software }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @software.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /softwares/1
  # PUT /softwares/1.xml
  def update
    @software = Software.find(params[:id])
    if params[:hardware]
      @software.hardwares << Hardware.find(params[:hardware]['hardware_id'])
    end
    respond_to do |format|
      if @software.update_attributes(params[:software])
        flash[:notice] = 'Software was successfully updated.'
        format.html { redirect_to(@software) }
        format.xml  { head :ok }
        format.js 
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @software.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /softwares/1
  # DELETE /softwares/1.xml
  def destroy
    @software = Software.find(params[:id])
    @software.destroy

    respond_to do |format|
      format.html { redirect_to(softwares_url) }
      format.xml  { head :ok }
      format.js do
        render :update do |page|
          page.remove "software_#{@software.id}"
        end
      end
    end
  end
end
