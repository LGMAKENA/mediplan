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
Appointment.destroy_all

puts "🌱 Seeding spices..." 
doctor1 = Doctor.create(title: "Dentist",email: "linet@test.com",full_name: "Linet Makena", username: "lgmakena",password: "Pass@123",dob: "1900-12-12",gender: "male")


patient1 = Patient.create( full_name: "Kennedy Musau",username: "kmusau", email:"kmusau@test.com",password: "Pass@123",dob: "1990-7-12",gender: "male")
patient2 = Patient.create( full_name: "Alex Kimathi",username: "akimathi", email:"akimathi@test.com",password: "Pass@123",dob: "1970-12-12",gender: "male")
patient3 = Patient.create( full_name: "Angela Kulola",username: "akulola", email:"akulola@test.com",password: "Pass@123",dob: "1950-2-12",gender: "female")

Appointment.create(date_time: DateTime.now + 1.day, description: "Dental Checkup", patient_id: patient1.id, doctor_id: doctor1.id)
Appointment.create(date_time: DateTime.now + 2.days, description: "Tooth Extraction", patient_id: patient1.id, doctor_id: doctor1.id)
Appointment.create(date_time: DateTime.now + 3.days, description: "Teeth Cleaning", patient_id: patient1.id, doctor_id: doctor1.id)
Appointment.create(date_time: DateTime.now + 4.days, description: "Orthodontic Consultation", patient_id: patient2.id, doctor_id: doctor1.id)
Appointment.create(date_time: DateTime.now + 5.days, description: "Braces Adjustment", patient_id: patient2.id, doctor_id: doctor1.id)
Appointment.create(date_time: DateTime.now + 6.days, description: "Follow-up", patient_id: patient2.id, doctor_id: doctor1.id)
Appointment.create(date_time: DateTime.now + 7.days, description: "Annual Checkup", patient_id: patient3.id, doctor_id: doctor1.id)
Appointment.create(date_time: DateTime.now + 8.days, description: "X-ray Examination", patient_id: patient3.id, doctor_id: doctor1.id)
Appointment.create(date_time: DateTime.now + 9.days, description: "Treatment Plan Discussion", patient_id: patient3.id, doctor_id: doctor1.id)


puts "✅ Done seeding!"