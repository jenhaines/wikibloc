require 'faker'
 
 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: "helloworld",
     # password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

#Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save


 # Create Wiki posts
 20.times do
   Wiki.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 wikis = Wiki.all
 
 
 puts "Seed finished"
 puts "#{users.count} users created"
 puts "#{wikis.count} wiki posts created"