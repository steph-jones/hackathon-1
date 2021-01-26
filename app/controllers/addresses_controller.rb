class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = @location.addresses
  end

  def show
  end

  def new
    @address = @location.addresses.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @address = @location.addresses.new(address_params)
    
    if @address.save
      redirect_to location_addresses_path(@location)
    else
      render partial: "form"
    end
  end

  def update
    if @address.update(address_params)
      redirect_to location_addresses_path(@location)
    else
      render partial: "form"
    end

  end

  def destroy
     @address.destroy
     redirect_to location_addresses_path(@location)
  end

  private 
  def set_location
    @location = location.find(params[:location_id])
  end

  def set_address
    @address = address.find(params[:location_id])
  end

  def address_params
    params.require(:address).permit(:name, :street_address, :city, :state, :zipcode)
  end
end
