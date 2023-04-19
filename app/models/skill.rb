class Skill < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 1000 }

  ### Relations

  ## user relations
  has_many :experience_tags, class_name: 'User::ExperienceTag', dependent: :destroy
  has_many :users, through: :experience_tags
end
