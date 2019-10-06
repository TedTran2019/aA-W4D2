# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create!(name: "Kitty", birth_date: Date.parse("1995-3-29"), color: "black",\
description: "He is a nice boi", sex: "m")

Cat.create!(name: "Angry", birth_date: Date.parse("2005-10-05"), color: "orange",\
description: "angry boy", sex: "m")

Cat.create!(name: "Saddy", birth_date: Date.parse("2016-6-11"), color: "white",\
description: "sad girl", sex: "f")

# CatRentalRequest.create!(cat_id: 1, start_date: Date.parse("2019-1-1"),\
# end_date: Date.parse("2019-2-1"))

# CatRentalRequest.create!(cat_id: 1, start_date: Date.parse("2019-1-15"),\
# end_date: Date.parse("2019-2-24"))
