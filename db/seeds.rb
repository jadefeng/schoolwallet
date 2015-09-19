# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  id: 0,
  first_name: "Jade",
  last_name: "Smith",
  email: "jade@jade.com",
  password_digest:
   "$2a$10$bBmNWP8sPo/UkM6GCcdtV.pyMxZHFuq8tmMhiLcnTNHUH/CBcjdFW",
   balance: 0
)

School.create(
	id: 0,
	name: "Wollongong Primary School"
	)

Child.create(
	id: 0,
	image_url: 'http://thehilljean.com/wp-content/uploads/2014/05/Tico-and-Tina-Haircut-.jpg',
	name: 'James Smith',
	balance: 0,
	school_id: 0,
	user_id: 0
	)

