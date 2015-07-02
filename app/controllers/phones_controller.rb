class PhonesController < ApplicationController
  def index
    @phones = Phone.all
  end

  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(phone_params)
    if @phone.save
      flash[:success] = "Phone successfully added"
      redirect_to phones_path
    else
      flash[:error] = @phone.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def phone_params
    params.require(:phone).permit(:phone_manufacturer_id, :year, :battery_life, :description)
  end
end
