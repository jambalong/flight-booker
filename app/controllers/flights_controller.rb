class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flight_dates = Flight.select("MIN(start_datetime) AS start_datetime")
                     .group("DATE(start_datetime)")
                     .order("MIN(start_datetime)")

    @flights = Flight.search_flights(search_params)
  end

  private

  def search_params
    params.permit(:departure_airport, :arrival_airport, :flight_date, :passenger_count, :commit)
  end
end
