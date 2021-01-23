class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validates :status, inclusion: { in: ["Validé", "En attente", "Refusé"] }
  validates :date_begin, :date_end, presence: true

  def total_price
    if date_begin.nil? || date_end.nil?
      "Sélectionnez des dates pour connaitre le prix"
    else
      (date_end - date_begin) / 1.hour * offer.price_per_hour
    end
  end
end
