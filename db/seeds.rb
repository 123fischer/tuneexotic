# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'deleting all tunes'
Tune.destroy_all

puts 'creating tunes'
20.times do
  email = Faker::Internet.email
  password = "123456"
  name = "Test"
  user = User.create(email: email, name: name, password: password)
  name = Faker::Hipster.words
  description = Faker::Hipster.sentences
  url = Faker::Internet.domain_name
  tune = Tune.new(name: name, description: description, url: url)
  tune.user = user
  tune.save
  puts "#{name} is created"
end

puts 'Done creating tunes'
