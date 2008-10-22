class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.xml
  def index
    @hardware = Hardware.find(params[:hardware_id])
    @tickets = Ticket.find(:all, :conditions => {:hardware_id => params[:hardware_id]})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id],
                          :conditions => {:hardware_id => params[:hardware_id]})

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @ticket = Ticket.new(:hardware_id => params[:hardware_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    if params[:software_id]
      @ticket = Ticket.new(params[:ticket])
      @ticket.software_id = params[:software_id]
    elsif params[:hardware_id]
      @ticket = Ticket.new(params[:ticket])
      @ticket.hardware_id = params[:hardware_id]
    else params[:document_id]
      @ticket = Ticket.new(params[:ticket])
      @ticket.document_id = params[:document_id]
    end

    respond_to do |format|
      if @ticket.save
        flash[:notice] = 'Ticket was successfully created.'
        if @ticket.hardware
          format.html { redirect_to @ticket.hardware }
        elsif @ticket.software
          format.html { redirect_to @ticket.software }
        else @ticket.document
          format.html { redirect_to @ticket.document }
        end
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = 'Ticket was successfully updated.'
      if @ticket.hardware
        redirect_to @ticket.hardware
      elsif @ticket.software
        redirect_to @ticket.software
      else
        redirect_to @ticket.document
      end
      #redirect_to request.env["HTTP_REFERER"]
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to request.env["HTTP_REFERER"]
    # respond_to do |format|
      # format.html { redirect_to(tickets_url) }
      # format.xml  { head :ok }
    # end
  end
end
