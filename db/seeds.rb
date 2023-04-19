# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# users.rb

user = User.create!(
  name: 'Normal User',
  nickname: 'User',
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password',
  account_type: 'user',
  confirmed_at: Time.now
)


client = User.create!(
  name: 'Client User',
  nickname: 'client',
  email: 'client@example.com',
  password: 'password',
  password_confirmation: 'password',
  account_type: 'client',
  confirmed_at: Time.now
)



freelancer = User.create!(
  name: 'Freelancer User',
  nickname: 'Freelancer',
  email: 'freelancer@example.com',
  password: 'password',
  password_confirmation: 'password',
  account_type: 'freelancer',
  confirmed_at: Time.now
)

freelancer2 = User.create!(
  name: 'Freelancer2 User',
  nickname: 'Freelancer2',
  email: 'freelancer2@example.com',
  password: 'password',
  password_confirmation: 'password',
  account_type: 'freelancer',
  confirmed_at: Time.now
)


client2 = User.create!(
  name: 'Client2 User',
  nickname: 'Client 2',
  email: 'client2@example.com',
  password: 'password',
  password_confirmation: 'password',
  account_type: 'client2',
  confirmed_at: Time.now
)

# user_profile_details.rb

User::ProfileDetail.create!(
  street: '123 Main St',
  country: 'USA',
  district: 'New York',
  age: 30,
  experience: 5,
  national_id: '123456fdg789',
  passport_id: '98765fg4321',
  user_id: 1 # assuming there is a user with id 1
)

User::ProfileDetail.create!(
  street: '123 Global St',
  country: 'Asia',
  district: 'China',
  age: 20,
  experience: 4,
  national_id: '123456fdgf',
  passport_id: '987654fyf',
  user_id: 2 # assuming there is a user with id 2
)

User::ProfileDetail.create!(
  street: '123 Street St',
  country: 'Monia',
  district: 'Greek',
  age: 60,
  experience: 3,
  national_id: '1234567',
  passport_id: '9876543',
  user_id: 3 # assuming there is a user with id 3
)

# user_social_media.rb

User::SocialMedium.create!(
  media_type: 'twitter',
  url: 'https://twitter.com/johndoe',
  user_id: 1 # assuming there is a user with id 1
)


User::SocialMedium.create!(
  media_type: 'twitter',
  url: 'https://twitter.com/',
  user_id: 2 # assuming there is a user with id 2
)

User::SocialMedium.create!(
  media_type: 'twitter',
  url: 'https://twitter.com/',
  user_id: 3 # assuming there is a user with id 3
)


User::SocialMedium.create!(
  media_type: 'facebook',
  url: 'https://facebook.com/',
  user_id: 1 # assuming there is a user with id 4
)


Skill.create(name: "Web Development", description: "Building websites and web applications using programming languages like HTML, CSS, and JavaScript.")
Skill.create(name: "Graphic Design", description: "Creating visual content for print and digital media using software like Adobe Photoshop and Illustrator.")
Skill.create(name: "Marketing", description: "Promoting products or services through advertising, public relations, and other communication strategies.")


User::ExperienceTag.create(user_id: 1, experience_tag_id: 1)
User::ExperienceTag.create(user_id: 1, experience_tag_id: 2)
User::ExperienceTag.create(user_id: 2, experience_tag_id: 3)

puts "Start a normal project flow"

# create project
# # id 1
project = Project.create!(title: "Build a website", description: "I need a website for my small business", location: "New York", project_type: "one-time", budget: 5000, duration: 30, deadline: Date.today + 60.days, client_id: client.id) # suppose client has user id 2

# # id 2
project2 = Project.create!(title: "Build A clone", description: "I need a website for my small business", location: "on-site", project_type: "full-time", budget: 5000, duration: 30, deadline: Date.today + 60.days, client_id: client2.id) # suppose client has user id 4


# create skills required for project

skill = Skill.create!(name: "React", description: "Building websites and web applications using programming languages like HTML, CSS, and JavaScript.")
skill2 = Skill.create!(name: "Database", description: "Creating visual content for print and digital media using software like Adobe Photoshop and Illustrator.")

# create project skills
Project::Tag.create!(project_id: project.id, skill_id: skill.id)
Project::Tag.create(project_id: project.id, skill_id: skill2.id)

Project::Tag.create(project_id: project2.id, skill_id: skill.id)


# create proposals
proposal = Project::Proposal.create!(project_id: project.id, client_id: client.id, freelancer_id: freelancer.id, description: "I can do this", bid_amount: 5000,  status: "pending")
proposal2 = Project::Proposal.create!(project_id: project.id, client_id: client.id, freelancer_id: freelancer.id, description: "I can do this better", bid_amount: 5000, status: "pending")
proposal3 = Project::Proposal.create!(project_id: project2.id, client_id: client.id, freelancer_id: freelancer.id, description: "I can do this best", bid_amount: 5000, status: "pending")

# create contract

contract = Contract.create!(project_id: project.id, client_id: client.id, freelancer_id: freelancer.id, description: "I can do this", agreed_amount: 5000, status: "pending", start_date: Date.today + 10.days, end_date: Date.today + 40.days)


# create payment

payment = PaymentDetail.create!(contract_id: contract.id, amount: 5000, status: "pending", method: "paypal", date: Date.today + 90.days, uid: "1234567890")
Review.create!(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  rating: 4,
  reviewer_id: 1, # assuming there is a user with id 1 as the reviewer
  reviewee_id: 2, # assuming there is a user with id 2 as the reviewee
  contract_id: contract.id
)


Review.create!(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  rating: 4,
  reviewer_id: 2, # assuming there is a user with id 2 as the reviewer
  reviewee_id: 1, # assuming there is a user with id 1 as the reviewee
  contract_id: contract.id
)

Review.create!(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  rating: 4,
  reviewer_id: 2, # assuming there is a user with id 2 as the reviewer
  reviewee_id: 3, # assuming there is a user with id 3 as the reviewee
  contract_id: contract.id

)
puts "Seeding done!"
