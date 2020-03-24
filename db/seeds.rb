# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do |i|
  User.create(
    name: Faker::Name.name,
    position: Faker::Job.seniority,
    office: Faker::Nation.nationality,
    age: rand(20..30)
  )
end
