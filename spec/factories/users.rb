FactoryGirl.define do
   factory :user do
     name "Douglas Adams"
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     role "standard"
     password "helloworld"
     password_confirmation "helloworld"
     confirmed_at Time.now
   end
 end