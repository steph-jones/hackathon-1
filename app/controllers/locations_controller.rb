class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = @trip.location
  end

  def show
  end

  def new
    @location = @trip.location.new
    # render partial: "form"
  end

  def edit
    # render partial: "form"
  end

  def create
    @location = @trip.location.new(location_params)
    
    if @location.save
      flash[:success] = "Location: #{@location.name} Created"
      # redirect_to trips_path
      redirect_to trip_locations_path(@trip)
    else
      flash[:error] = "Error #{@location.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def update
    if @location.update(location_params)
      # redirect_to trips_path
      redirect_to trip_locations_path(@trip)
    else
      render :edit
    end

  end

  def destroy
     @location.destroy
     redirect_to trip_locations_path(@trip)
  end

  private 
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_location
    @location = Location.find(params[:trip_id])
  end

  def location_params
    params.require(:location).permit(:name, :duration)
  end
end
