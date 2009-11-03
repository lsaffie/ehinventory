class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.xml
  def index
    @hardware = Hardware.find(params[:hardware_id])
    @tickets = Ticket.find(:all, :conditions => {:hardware_id => params[:hardware_id]})

    respond_to do |format|
      format.html { render :partial => 'ticket', :collection => @hardware.tickets }
      format.xml  { render :xml => @tickets }
      format.js { render :partial => 'ticket' }
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
    @ticket = Ticket.new(params[:ticket])
    if params[:software_id]
      @ticket.software_id = params[:software_id]
    elsif params[:hardware_id]
      @ticket.hardware_id = params[:hardware_id]
    else params[:document_id]
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
        format.js 
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
    @hardware = @ticket.hardware
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to(hardware_tickets_path(@hardware)) }
      format.xml  { head :ok }
    end
  end
end
