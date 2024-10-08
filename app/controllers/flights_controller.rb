class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flight_dates = Flight.select("DATE(start_datetime) AS flight_date").distinct

    @flights = Flight.search_flights(search_params)
  end

  private

  def search_params
    params.permit(:departure_airport, :arrival_airport, :flight_date, :passenger_count, :commit)
  end
end
