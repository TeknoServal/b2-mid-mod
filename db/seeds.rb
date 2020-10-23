# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@mechanic1 = Mechanic.create!(name: 'Bob', experience: 7)
@mechanic2 = Mechanic.create!(name: 'Carol', experience: 9)
@mechanic3 = Mechanic.create!(name: 'Harry', experience: 6)

@park1 = Park.create!(name: 'Wonder Fun Land', admission_price: 25.50)

@ride1 = @park1.rides.create!(name: 'Poo Poo Pee Pants', thrill_rating: 4)
@ride2 = @park1.rides.create!(name: 'Holy Amazeballs', thrill_rating: 8)


@mechanic1.rides << @ride1
@mechanic1.rides << @ride2
