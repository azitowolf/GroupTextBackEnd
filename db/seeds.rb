# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

alex = User.create! name:"Alex", image:"http://www.c4dcafe.com/ipb/uploads/profile/photo-thumb-155544.png", email:"azw@verizon.net", password:"123", password_confirmation:nil
max = User.create! name:"Max", image:"http://www.c4dcafe.com/ipb/uploads/profile/photo-thumb-155544.png", email:"mk@verizon.net", password:"123", password_confirmation:nil
andrew = User.create! name:"Andrew", image:"http://www.c4dcafe.com/ipb/uploads/profile/photo-thumb-155544.png", email:"ae@verizon.net", password:"123", password_confirmation:nil

p1 = alex.ptexts.create! history:"#1: Hi! #2: hey there world!", text:"im moving to kansas", number: 6172
p2 = max.ptexts.create! history:"#1: I was spending all day coding and napping with my computer #2: I am pissed!", text:"im moving to kansas", number: 6172

# s1 = p1.stexts.create! user: alex, text:"Alex Z needs a place to stay, hes clean and well mannered"
# s2 = p2.stexts.create! user: max, text:"sorry babe, but honestly you just dont look as good in a skirt as this web app looks with a fresh authentication gem"
# # s3 = p3.stexts.create! user:andrew, title:'good call', text:"Hi barkeep, I may have lost my card at your place, could I flop on over and pick it up?"

# s1.liked_by alex
# s2.liked_by alex


