class PortsController < ApplicationController
  def index
    @ports = Port.find(:all, :order => :patch1)
  end

  def show
    @port = Port.find(params[:id])
  end

  def new
    @rooms = Room.find :all
    @port = Port.new
  end

  def edit
    @rooms = Room.find :all
    @port = Port.find(params[:id])
  end

  def create
    port = Port.create(params[:port])
    port.room_id = params[:port]['room_id']
    redirect_to(ports_path) if port.save
  end

  def update
    @port = Port.find(params[:id])
    if @port.update_attributes(params[:port])
      redirect_to(ports_path)
    else
      Puts 'Error Saving Port'
    end
  end

  def destroy
    port = Port.find(params[:id])
    if port.destroy
      redirect_to ports_path
    end
  end
end
