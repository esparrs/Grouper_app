class LocationsController < ApplicationController
  def index
    if params[:search].present?
      @locations = Location.where("end_time>?", DateTime.now).near(params[:search], 0.75, :order => 'start_time, distance')
    else
      @locations = Location.where("end_time>?", DateTime.now).order(:start_time)
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      redirect_to @location, :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed event."
  end
end
