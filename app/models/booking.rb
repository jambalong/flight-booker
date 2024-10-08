class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  has_many :passengers
  accepts_nested_attributes_for :passengers

  validates :flight_id, presence: true
  validates :user_id, presence: true
  validates :passenger_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
