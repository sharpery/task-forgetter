10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(6)
  )
end

users = User.all

50.times do
  Item.create!(
    title: Faker::Lorem.sentence,
    user: users.sample
  )
end

puts "#{User.count} users created"
puts "#{Item.count} items created"
