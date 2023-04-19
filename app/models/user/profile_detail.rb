class User::ProfileDetail < ApplicationRecord
  ### relations
  belongs_to :user

  validates :street, presence: true
  validates :country, presence: true
  validates :district, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :experience, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :national_id, presence: true, uniqueness: true
  validates :passport_id, presence: true, uniqueness: true
end
