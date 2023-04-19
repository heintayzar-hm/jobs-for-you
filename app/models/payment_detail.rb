class PaymentDetail < ApplicationRecord

  belongs_to :contract, class_name: 'Contract', foreign_key: 'contract_id', dependent: :destroy

  validates :account_number, presence: true, length: { maximum: 20 }
  validates :method, presence: true, inclusion: { in: %w[bank paypal] }
  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending completed cancelled] }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
