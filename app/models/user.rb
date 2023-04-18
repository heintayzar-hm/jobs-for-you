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
  has_one :profile_details, class_name: 'User::ProfileDetail', dependent: :destroy
  has_many :social_media, class_name: 'User::SocialMedium', dependent: :destroy
  has_and_belongs_to_many :experience_tags, class_name: 'User::ExperienceTag'

  has_many :recieved_reviews, class_name: 'Review', foreign_key: 'reviewee_id', dependent: :destroy
  has_many :given_reviews, class_name: 'Review', foreign_key: 'reviewer_id', dependent: :destroy
end
