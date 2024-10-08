# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airport_codes = [ 'SEA', 'LAX', 'NYC', 'HNL', 'MIA', 'SFO', 'ATL', 'ORD' ]
airport_codes.each do |airport_code|
  Airport.find_or_create_by!(code: airport_code)
end

airports = Airport.all.to_a
flight_dates = (0..5).map { |i| DateTime.now + i.days }

flight_dates.each do |flight_date|
  airports.permutation(2).each do |departure_airport, arrival_airport|
    2.times do |i|
      random_hour = rand(0..23)
      random_minute = rand(0..59)

      start_datetime = flight_date.change(hour: random_hour, min: random_minute)

      Flight.find_or_create_by!(
        departure_airport: departure_airport,
        arrival_airport: arrival_airport,
        start_datetime: start_datetime,
        duration: rand(60..600)
      )
    end
  end
end
