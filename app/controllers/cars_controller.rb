class CarsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
	 def search
    @cars_l = []
    @cars_q = Car.search_by_model_and_brand(params[:query])
    @cars_l += Car.near(params[:brand, :model], 20)
    if params[:brand, :model].blank?
      @cars = @cars_q
    elsif params[:query].blank?
      @cars = @cars_l
    else
      @cars = @cars_l.select { |elem| @cars_q.include?(elem) }
    end
     render :search
   end

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
