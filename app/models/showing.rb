class Showing < ApplicationRecord
  belongs_to :screen
  belongs_to :movie
  has_many :bookings
end
