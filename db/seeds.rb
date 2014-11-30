require 'faker'
 
 # Create Users
 15.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: "helloworld",
     role: ['standard', 'premium'].sample,
     roledate: Time.now
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
 30.times do
   Wiki.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph,
     hide: [true, false].sample
   ) 
 end

 wikis = Wiki.all
 
 #Create Collaborations
 wikis.each do |w|
  if w.hide?
    c = rand(1..5)
    c.times { w.users << users.sample}
    w.save!
  end
end


 
 puts "Seed finished"
 puts "#{users.count} users created"
 puts "#{wikis.count} wiki posts created"