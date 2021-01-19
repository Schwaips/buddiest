class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validates :status, inclusion: { in: ["Validé", "En attente", "Refusé"] }
end
