# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alex = User.create! email:"azw@verizon.net", password:"123", password_confirmation:nil
max = User.create! email:"mk@verizon.net", password:"123", password_confirmation:nil
andrew = User.create! email:"ae@verizon.net", password:"123", password_confirmation:nil

alex.ptexts.create! title:'tough situation with landlord', history:"I told her i couldnt pay, she said yes you can, or im gonna kick you out", text:"im moving to kansas"
max.ptexts.create! title:'girlfriends mad about coding', history:"I was spending all day coding, and napping with my computer, and my gf is pissed!", text:"im moving to kansas"
andrew.ptexts.create! title:'was so drunk last night', history:"lost my card and then went swimming last night", text:"please find my credit card for me"

alex.stexts.create! title:'good call', text:"Alex Z needs a place to stay, hes clean and well mannered", votes:4
max.stexts.create! title:'hm', text:"sorry babe, but honestly you just dont look as good in a skirt as this web app looks with a fresh authentication gem", votes:4
andrew.stexts.create! title:'good call', text:"Hi barkeep, I may have lost my card at your place, could I flop on over and pick it up?", votes:4
