class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validates :status, inclusion: { in: ["Validé", "En attente", "Refusé"] }
  validates :date_begin, :date_end, presence: true
end
