# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


shelter_admin = User.create(first_name: 'Jane', last_name: 'Smith', username: 'janesmith', password: 'password', email: 'janesmith@janesmith.com', shelter_admin: true)
avg_user = User.create(first_name: 'Joe', last_name: 'Smith', username: 'joesmith', password: 'password', email: 'joesmith@joesmith.com', shelter_admin: false)
city = City.create(name: 'Seoul')
shelter_one = Shelter.create(name: "Needs Love", address: "Gangnam Station Exit 2", email: 'needslove@lovepets.com', user_id: 1, city_id: 1 )
pet_one = Pet.create(name: 'Mishka', pet_type: 'Dog', breed: 'Pembroke Welsh Corgi', description: 'Found on the side of the road. Very friendly to other dogs and humans. Needs a loving home.', shelter_id: 1, user_id: 1, adopted: false)
