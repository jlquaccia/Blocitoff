require 'faker'

# Create Users
25.times do
  user = User.new(
      name:     Faker::Name.name,
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
end

users = User.all

# Create Items
50.times do
  Item.create!(
      user: users.sample,
      name: Faker::Lorem.sentence
      )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"