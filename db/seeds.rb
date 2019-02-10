# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
User.find_or_create_by(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
Event.find_or_create_by(name: Faker::Lorem.word, description: Faker::Lorem.sentence, lat: Faker::Address.latitude, lng: Faker::Address.longitude)
Event.find_or_create_by(name: Faker::Lorem.word, description: Faker::Lorem.sentence, lat: Faker::Address.latitude, lng: Faker::Address.longitude)
Event.find_or_create_by(name: Faker::Lorem.word, description: Faker::Lorem.sentence, lat: Faker::Address.latitude, lng: Faker::Address.longitude)