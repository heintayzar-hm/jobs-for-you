class User::ExperienceTag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }

  #### relations
  has_and_belongs_to_many :users, class_name: 'User'
end
