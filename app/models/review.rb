class Review < ApplicationRecord
  validates :rating, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :text, presence: true, length: { maximum: 1000 }

  ### relations
  belongs_to :reviewer, class_name: 'User'
  belongs_to :reviewee, class_name: 'User'
  belongs_to :contract, class_name: 'Contract'
end
