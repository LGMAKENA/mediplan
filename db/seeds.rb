# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying existing data..."
Doctor.destroy_all 
Patient.destroy_all
puts "🌱 Seeding spices..." 
Doctor.create(title: "Dentist",email: "linet@test.com",full_name: "Linet Makena", username: "lgmakena",password: "Pass@123",dob: "1900-12-12",gender: "male")


patient1 = Patient.create( username: "lgmakena", email:"kmusau@test.com",password: "Pass@123",dob: "1990-7-12",gender: "male")
patient2 = Patient.create( username: "akimathi", email:"akimathi@test.com",password: "Pass@123",dob: "1970-12-12",gender: "male")
patient3 = Patient.create( username: "akulola", email:"akulola@test.com",password: "Pass@123",dob: "1950-2-12",gender: "female")







puts "✅ Done seeding!"