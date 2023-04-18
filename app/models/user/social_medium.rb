class User::SocialMedium < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :url, presence: true, length: { maximum: 100 }

  ### relations
  belongs_to :user
end
