FactoryGirl.define do
  factory :wiki do
    title "Wiki Title"
    body "Wiki bodies must be pretty long."
    user
  end
end