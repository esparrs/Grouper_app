class EventsController < ApplicationController
  def index
    if params[:search].present?
      @locations = Event.where("end>?", DateTime.now).near(params[:search], 0.75, :order => 'start_time, distance')
    else
      @locations = Event.where("end>?", DateTime.now).order(:start)
    end
  end

  def show
    @location = Event.find(params[:id])
  end

  def new
    @location = Event.new
  end

  def create
    @location = Event.new(params[:location])
    if @location.save
      redirect_to @location, :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @location = Event.find(params[:id])
  end

  def update
    @location = Event.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @location = Event.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed event."
  end
end
