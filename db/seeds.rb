# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


shelter_admin = User.create(name: 'Jane Smith', username: 'janesmith', password: 'password', email: 'janesmith@janesmith.com', shelter_admin: true)
avg_user = User.create(name: 'Joe Smith', username: 'joesmith', password: 'password', email: 'joesmith@joesmith.com', shelter_admin: false)
shelter_admin_two = User.create(name: 'Hyori Lee', username: 'leehyori', password: 'password', email: 'hyori@hyori.com', shelter_admin: true)
city_one = City.create(name: 'Seoul')
shelter_one = Shelter.create(name: "Needs Love", address: "Gangnam Station Exit 2", email: 'needslove@lovepets.com', user_id: 1, city_id: 1 )
shelter_two = Shelter.create(name: "Karma", address: 'Yongin', email: 'karma@karma.com', user_id: 3, city_id: 1)
pet_one = Pet.create(name: 'Mishka', pet_type: 'Dog', breed: 'Pembroke Welsh Corgi', gender: 'Boy', neutered: true, description: 'Found on the side of the road. Very friendly to other dogs and humans. Needs a loving home.', shelter_id: 1, city_id: 1, user_id: 1, adopted: false)
pet_two = Pet.create(name: 'Lovely', pet_type: 'Dog', breed: 'Pembroke Welsh Corgi', gender: 'Girl', neutered: false, description: 'Surrendered by previous owner due to poor health. Big cuddle-bug.', shelter_id: 1, city_id: 1, user_id: 1, adopted: false)
pet_three = Pet.create(name: 'Coco', pet_type: 'Cat', breed: 'Persian', gender: 'Girl', neutered: false, description: 'Found crying for mom. Needs foster or adopter immediately.', shelter_id: 2, user_id: 3, city_id: 1, adopted: false)