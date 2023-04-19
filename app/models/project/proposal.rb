class Project::Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :client, class_name: 'User'
  belongs_to :freelancer, class_name: 'User'

  validates :status, presence: true, inclusion: { in: %w[pending in-progress completed cancelled] }
  validates :bid_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 1000 }
end
