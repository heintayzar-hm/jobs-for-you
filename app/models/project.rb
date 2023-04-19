class Project < ApplicationRecord

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :budget, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending in-progress completed cancelled] }
  validates :deadline, presence: true
  validates :location, presence: true, inclusion: { in: %w[remote on-site] }
  validates :project_type, presence: true, inclusion: { in: %w[freelance full-time part-time] }

  belongs_to :client, class_name: 'User'

  has_many :proposals, class_name: 'Project::Proposal', dependent: :destroy
  has_many :contracts, dependent: :destroy
end
