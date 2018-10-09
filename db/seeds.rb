# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#BANG! in the create method makes the error to popup (not failing silently) when db:setup
@user = User.create!(email: "user@test.com", 
                    password: "foobar", 
                    password_confirmation: "foobar",                         
                    first_name: "Regular", 
                    last_name: "User",
                    phone: "884818313")
puts "1 regular user created"

@admin_user = AdminUser.create!(email: "admin@test.com", 
                              password: "foobar", 
                              password_confirmation: "foobar", 
                              first_name: "Admin", 
                              last_name: "User",
                              phone: "884818313")
puts "1 admin user created"

@n = 20
@n.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.", user_id: @user.id, overtime_request: 2.5)
end
puts "#{@n} Posts have been created"

@n.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.", user_id: @admin_user.id, overtime_request: 2.5)
end
puts "#{@n} Posts have been created"

@n.times do |audit|
  AuditLog.create!(user_id: @user.id,  status: 0, start_date: (Date.today - 6.days))
end
puts "#{@n} Audit Logs have been created"