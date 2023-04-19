class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # In production, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  ## Validation

  validates :name, presence: true
  validates :nickname, length: { maximum: 20 }
  validates :email, presence: true
  validates :account_type, length: { maximum: 10 }

  ### Relations

  ## profile relations
  has_one :profile_details, class_name: 'User::ProfileDetail', dependent: :destroy
  has_many :social_media, class_name: 'User::SocialMedium', dependent: :destroy

  ## review relations
  has_many :received_reviews, class_name: 'Review', foreign_key: 'reviewee_id', dependent: :destroy
  has_many :given_reviews, class_name: 'Review', foreign_key: 'reviewer_id', dependent: :destroy

  ## Tags or skills relation
  has_many :experience_tags, class_name: 'User::ExperienceTag', dependent: :destroy
  has_many :skills, through: :experience_tags

  ## Project relations

  # Project
  has_many :projects, dependent: :destroy

  # proposals
  has_many :client_proposals, class_name: 'Project::Proposal', foreign_key: 'client_id', dependent: :destroy
  has_many :freelancer_proposals, class_name: 'Project::Proposal', foreign_key: 'freelancer_id', dependent: :destroy

  # contracts
  has_many :client_contracts, class_name: 'Contract', foreign_key: 'client_id', dependent: :destroy
  has_many :freelancer_contracts, class_name: 'Contract', foreign_key: 'freelancer_id', dependent: :destroy

end
