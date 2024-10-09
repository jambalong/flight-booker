class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:selected_flight])
    @booking = Booking.new(passenger_count: params[:passenger_count])
    @booking.passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "Booking was created!"
    else
      @flight = Flight.find(params[:booking][:flight_id])
      @booking.passenger_count.times { @booking.passengers.build }
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :user_id, :passenger_count, passengers_attributes: [ :name, :email ])
  end
end
