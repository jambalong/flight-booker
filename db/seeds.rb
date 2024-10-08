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

airports = Airport.all

flights = [
  { departure_airport: airports.find { |a| a.code == 'SEA' }, arrival_airport: airports.find { |a| a.code == 'LAX' }, start_datetime: DateTime.now + 1.day, duration: 120 },
  { departure_airport: airports.find { |a| a.code == 'LAX' }, arrival_airport: airports.find { |a| a.code == 'NYC' }, start_datetime: DateTime.now + 2.days, duration: 300 },
  { departure_airport: airports.find { |a| a.code == 'NYC' }, arrival_airport: airports.find { |a| a.code == 'HNL' }, start_datetime: DateTime.now + 3.days, duration: 600 },
  { departure_airport: airports.find { |a| a.code == 'MIA' }, arrival_airport: airports.find { |a| a.code == 'ORD' }, start_datetime: DateTime.now + 4.days, duration: 150 },
  { departure_airport: airports.find { |a| a.code == 'SFO' }, arrival_airport: airports.find { |a| a.code == 'ATL' }, start_datetime: DateTime.now + 5.days, duration: 180 },
  { departure_airport: airports.find { |a| a.code == 'ORD' }, arrival_airport: airports.find { |a| a.code == 'MIA' }, start_datetime: DateTime.now + 6.days, duration: 200 },
  { departure_airport: airports.find { |a| a.code == 'HNL' }, arrival_airport: airports.find { |a| a.code == 'SEA' }, start_datetime: DateTime.now + 7.days, duration: 480 },
  { departure_airport: airports.find { |a| a.code == 'NYC' }, arrival_airport: airports.find { |a| a.code == 'SFO' }, start_datetime: DateTime.now + 8.days, duration: 360 },
  { departure_airport: airports.find { |a| a.code == 'ATL' }, arrival_airport: airports.find { |a| a.code == 'LAX' }, start_datetime: DateTime.now + 9.days, duration: 300 },
  { departure_airport: airports.find { |a| a.code == 'LAX' }, arrival_airport: airports.find { |a| a.code == 'ORD' }, start_datetime: DateTime.now + 10.days, duration: 240 },
  { departure_airport: airports.find { |a| a.code == 'MIA' }, arrival_airport: airports.find { |a| a.code == 'HNL' }, start_datetime: DateTime.now + 11.days, duration: 480 }
]

flights.each do |data|
  Flight.find_or_create_by!(
    departure_airport: data[:departure_airport],
    arrival_airport: data[:arrival_airport],
    start_datetime: data[:start_datetime],
    duration: data[:duration]
  )
end
