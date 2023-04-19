class Contract < ApplicationRecord
  belongs_to :project
  belongs_to :client, class_name: 'User'
  belongs_to :freelancer, class_name: 'User'

  has_many :reviews, dependent: :destroy
  validates :status, presence: true, inclusion: { in: %w[pending in-progress completed cancelled] }
  validates :start_date, presence: true, date: true
  validates :end_date, presence: true, date: true
end
