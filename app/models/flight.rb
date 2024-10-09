class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :bookings

  validates :start_datetime, presence: true
  validates :duration, presence: true

  def self.search_flights(search_params)
    flights = all.where(
      "departure_airport_id = ? AND arrival_airport_id = ? AND DATE(start_datetime) = ?",
      search_params[:departure_airport],
      search_params[:arrival_airport],
      search_params[:flight_date]
    )

    flights
  end
end
