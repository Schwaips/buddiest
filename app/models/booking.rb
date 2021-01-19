class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validates :status, inclusion: { in: ["Valider", "En attente", "Refuser"] }
end
