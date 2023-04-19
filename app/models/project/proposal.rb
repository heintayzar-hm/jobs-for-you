class Project::Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :client, class_name: 'User'
  belongs_to :freelancer, class_name: 'User'
end
