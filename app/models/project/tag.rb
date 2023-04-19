class Project::Tag < ApplicationRecord
  belongs_to :project
  belongs_to :skill, class_name: 'Skill'
end
