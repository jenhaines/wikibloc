require 'faker'

FactoryGirl.define do
   factory :user do |f|
     f.name { Faker::Name.name }
     f.email { Faker::Internet.email }
     f.role { "standard" }
     f.password {"helloworld"}     
     f.password_confirmation {'helloworld'}
     f.confirmed_at { Time.now }
   end
 end
