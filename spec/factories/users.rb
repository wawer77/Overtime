FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end
  
  factory :user do
    first_name {"Jon"}
    last_name {"Snow"}
    email {generate :email}
    password {"foobar"}
    password_confirmation {"foobar"}
    phone {"123456789"}
  end
  
  factory :admin_user, class: "AdminUser" do
    first_name {"Admin"}
    last_name {"User"}
    email {generate :email}
    password {"foobar"}
    password_confirmation {"foobar"}
    phone {"123456789"}
  end
  
    factory :non_authorized_user, class: "User" do
    first_name {"Nonauth"}
    last_name {"User"}
    email {generate :email}
    password {"foobar"}
    password_confirmation {"foobar"}
    phone {"123456789"}
  end
end