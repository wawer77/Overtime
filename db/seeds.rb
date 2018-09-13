# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



@user = User.create(email: "user@test.com", 
                    password: "foobar", 
                    assword_confirmation: "foobar",                         
                    first_name: "Jon", 
                    last_name: "Snow",
                    phone: "884818313")
puts "1 regular user created"

@admin_user = AdminUser.create(email: "admin@test.com", 
                              password: "foobar", 
                              password_confirmation: "foobar", 
                              first_name: "Admin", 
                              last_name: "User"
                              phone: "884818313")
puts "1 admin user created"

@n = 5
@n.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end
puts "#{@n} Posts have been created"

@n.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @admin_user.id, overtime_request: 2.5)
end
puts "#{@n} Posts have been created"