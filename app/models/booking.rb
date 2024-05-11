class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :showing
  belongs_to :seat
end
