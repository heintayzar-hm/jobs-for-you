class Skill < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 1000 }

  ### Relations

  ## user relations
  has_many :experience_tags, class_name: 'User::ExperienceTag', dependent: :destroy
  has_many :project_skills, class_name: 'Project::Skill', dependent: :destroy
  has_many :projects, through: :project_skills
  has_many :users, through: :experience_tags
end
