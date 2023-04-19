# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# users.rb

User.create!(
  name: 'Normal User',
  nickname: 'User',
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password',
  account_type: 'user',
  confirmed_at: Time.now
)


User.create!(
  name: 'Client User',
  nickname: 'client',
  email: 'client@example.com',
  password: 'password',
  password_confirmation: 'password',
  account_type: 'client',
  confirmed_at: Time.now
)



User.create!(
  name: 'Freelancer User',
  nickname: 'Freelancer',
  email: 'freelancer@example.com',
  password: 'password',
  password_confirmation: 'password',
  account_type: 'freelancer',
  confirmed_at: Time.now
)

User.create!(
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
  national_id: '123456789',
  passport_id: '987654321',
  user_id: 1 # assuming there is a user with id 1
)

User::ProfileDetail.create!(
  street: '123 Global St',
  country: 'Asia',
  district: 'China',
  age: 20,
  experience: 4,
  national_id: '123456789',
  passport_id: '987654321',
  user_id: 2 # assuming there is a user with id 2
)

User::ProfileDetail.create!(
  street: '123 Street St',
  country: 'Monia',
  district: 'Greek',
  age: 60,
  experience: 3,
  national_id: '123456789',
  passport_id: '987654321',
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


Review.create!(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  rating: 4,
  reviewer_id: 1, # assuming there is a user with id 1 as the reviewer
  reviewee_id: 2 # assuming there is a user with id 2 as the reviewee
)


Review.create!(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  rating: 4,
  reviewer_id: 2, # assuming there is a user with id 2 as the reviewer
  reviewee_id: 1 # assuming there is a user with id 1 as the reviewee
)

Review.create!(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  rating: 4,
  reviewer_id: 2, # assuming there is a user with id 2 as the reviewer
  reviewee_id: 3 # assuming there is a user with id 3 as the reviewee
)

Review.create!(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  rating: 4,
  reviewer_id: 3, # assuming there is a user with id 3 as the reviewer
  reviewee_id: 4 # assuming there is a user with id 4 as the reviewee
)



puts "Seeding done!"
