class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create 
    @trip = current_user.trips.new(trip_params)
      if @trip.save
        flash[:success] = "Trip: #{@trip.name} Created"
        redirect_to trips_path
      else
        flash[:error] = "Error #{@trip.errors.full_messages.join("\n")}"
        render :new
      end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:name, :description, :start_date, :end_date)
    end

    # don't just find by the trip model or you may potentially be able to view other users trips
    def set_trip
      @trip = current_user.trips.find(params[:id])
    end

  end
