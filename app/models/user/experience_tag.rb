class User::ExperienceTag < ApplicationRecord
  # this is a join table

  #### relations
  belongs_to :user
  belongs_to :experience_tag, class_name: 'Skill'
end
