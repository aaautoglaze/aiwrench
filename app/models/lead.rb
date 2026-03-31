class Lead < ApplicationRecord
  INDUSTRIES = [
    "Construction",
    "Property Management",
    "Professional Services",
    "Healthcare",
    "Retail",
    "Other"
  ].freeze

  SERVICES = [
    "Ignite $2,500",
    "Wrench $1,200/mo",
    "Blueprint Custom",
    "Not sure yet"
  ].freeze

  STATUSES = %w[new contacted qualified closed].freeze

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :industry, inclusion: { in: INDUSTRIES, allow_blank: true }
  validates :service_interest, inclusion: { in: SERVICES, allow_blank: true }
  validates :status, inclusion: { in: STATUSES }

  scope :ordered, -> { order(created_at: :desc) }
  scope :by_status, ->(status) { where(status: status) if status.present? }
end
