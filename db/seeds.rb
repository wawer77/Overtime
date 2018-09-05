# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



@user = User.create(email: "user@test.com", password: "foobar", password_confirmation: "foobar", first_name: "Jon", last_name: "Snow")
puts "1 regular user created"

@admin_user = AdminUser.create(email: "admin@test.com", password: "foobar", password_confirmation: "foobar", first_name: "Jon", last_name: "Snow")
puts "1 admin user created"
100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"