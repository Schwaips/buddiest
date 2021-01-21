class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validates :status, inclusion: { in: ["Validé", "En attente", "Refusé"] }

  def total_price
    (date_end - date_begin) / 1.hour * offer.price_per_hour
  end
end
