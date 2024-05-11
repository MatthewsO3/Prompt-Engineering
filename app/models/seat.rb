class Seat < ApplicationRecord
  belongs_to :screen
  has_many :bookings
end
