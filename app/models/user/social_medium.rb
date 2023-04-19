class User::SocialMedium < ApplicationRecord
  validates :media_type, presence: true, length: { maximum: 50 }
  validates :url, presence: true, length: { maximum: 100 }

  ### relations
  belongs_to :user
end
