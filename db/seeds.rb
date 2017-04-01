# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  about: Faker::Lorem.sentence(10),
  email: Faker::Internet.email,
  password: 'password',
  password_confirmation: 'password'
  )
end

User.all.each do |user|
  rand(2..5).times do
    Post.create(
    tile: Faker::Lorem.sentence(10),
    body: Faker::Lorem.paragraph(rand(30)+30),
    user_id: user.id
    )
  end
end


Post.all.each do |post|
  rand(6..10).times do
    post.comments.create(
    body: Faker::Lorem.sentence(10),
    user_id: User.all.sample.id
    )
  end
end
