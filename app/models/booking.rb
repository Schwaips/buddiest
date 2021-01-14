class Booking < ApplicationRecord
  belongs_to :offer
  # belongs_to :user, through :offer
  belongs_to :user
end
