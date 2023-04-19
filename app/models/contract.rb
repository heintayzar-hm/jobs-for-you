class Contract < ApplicationRecord
  belongs_to :project
  belongs_to :client, class_name: 'User'
  belongs_to :freelancer, class_name: 'User'

  has_many :payment_details, dependent: :destroy

  has_many :reviews, dependent: :destroy
  validates :status, presence: true, inclusion: { in: %w[pending in-progress completed cancelled] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :agreed_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
