# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Destroy_all
User.destroy_all

# Seed admin user
User.create(
    email:                  "tppk@love",
    password:               "tepepeka",
    password_confirmation:  "tepepeka",
    is_admin?:               true
)
puts "admin created"


# Seed current_users
5.times do |i|
    User.create(
      email:                      Faker::Internet.email,
      password:                   "azerty",
      password_confirmation:      "azerty"
    )
    puts "#{i} user(s) created"
    puts "*"*(i+1)
  end