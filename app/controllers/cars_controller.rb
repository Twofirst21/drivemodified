class CarsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
	def index
		@cars = Car.all
	end 

	def show
		@car = Car.find(params[:id])
		@booking = Booking.new
	end

	def new 
		@car = Car.new
	end

	def create 
		@car = Car.create(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
	end 
	
end
