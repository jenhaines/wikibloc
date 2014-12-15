require 'faker'

FactoryGirl.define do
   factory :user do |f|
     f.name { Faker::Name.name }
     f.email { Faker::Internet.email }
     f.role {['standard', 'premium'].sample }
     f.password {"helloworld"}     
     f.password_confirmation {'helloworld'}
     f.confirmed_at { Time.now }
   end
 end

# FactoryGirl.define do
#    factory :user do
#      name "Douglas Adams"
#      sequence(:email, 100) { |n| "person#{n}@example.com" }
#      role "standard"
#      password "helloworld"
#      password_confirmation "helloworld"
#      confirmed_at Time.now
#    end
#  end