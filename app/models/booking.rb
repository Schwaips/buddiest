class Booking < ApplicationRecord
  has_one :offer
  has_one :user
end
