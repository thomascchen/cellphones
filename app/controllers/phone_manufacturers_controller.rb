class PhoneManufacturersController < ApplicationController
  def index
    @phone_manufacturers = PhoneManufacturer.all
  end

  def new
    @phone_manufacturer = PhoneManufacturer.new
  end

  def create
    @phone_manufacturer = PhoneManufacturer.new(phone_manufacturer_params)
    if @phone_manufacturer.save
      redirect_to phone_manufacturers_path
    else
      flash[:error] = @phone_manufacturer.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def phone_manufacturer_params
    params.require(:phone_manufacturer).permit(:name, :country)
  end
end
