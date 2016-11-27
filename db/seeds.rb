# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new(
    email: "john@aaa.pl",
    password: "aaa12345",
    password_confirmation: "aaa12345",
    user_name: "John"
)
user.save!

user1 = User.new(
    email: "matt@aaa.pl",
    password: "aaa12345",
    password_confirmation: "aaa12345",
    user_name: "Matt"
)
user1.save!

post1 = Post.new(
    title: "My new cat",
    caption: "He is really cute",
    created_at: Time.now,
    image: File.new('app/assets/images/cat.jpg'),
    user_id: 1
)
post1.save!

post2 = Post.new(
    title: "Mountains",
    caption: "Waiting for winter",
    created_at: Time.now,
    image: File.new('app/assets/images/mountains.jpg'),
    user_id: 1
)
post2.save!

post3 = Post.new(
    title: "Memories of sea",
    caption: "I could be there",
    created_at: Time.now,
    image: File.new('app/assets/images/sea.jpg'),
    user_id: 2
)
post3.save!

post4 = Post.new(
    title: "Sunset",
    caption: "Just beautiful!",
    created_at: Time.now,
    image: File.new('app/assets/images/sunset.jpg'),
    user_id: 1
)
post4.save!

10.times do |n|
  user_id = Faker::Number.between(1, 2)
  post_id = Faker::Number.between(1, 4)
  content = Faker::Hipster.word
  created_at = Time.now

  Comment.create!(
      user_id: user_id,
      post_id: post_id,
      content: content,
      created_at: created_at
  )
end