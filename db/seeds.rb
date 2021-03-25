# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
furniture = Category.create(name: 'Furniture')
baby_furniture = Category.create(name: 'Baby furniture')
decoration = Category.create(name: 'Decoration')

decosy_best_seller = Category.create(name: 'Decosy Best Sellers', parent_id: furniture.id)
living_room = Category.create(name: 'Living Room', parent_id: furniture.id)
dinning_room = Category.create(name: 'Dinning Room', parent_id: furniture.id)
bedroom = Category.create(name: 'Bedroom', parent_id: furniture.id)
bathroom = Category.create(name: 'Bathroom', parent_id: furniture.id)
kitchen = Category.create(name: 'Kitchen', parent_id: furniture.id)
office = Category.create(name: 'Office', parent_id: furniture.id)

baby_best_seller = Category.create(name: 'Best Sellers', parent_id: baby_furniture.id)
baby_furniture = Category.create(name: 'Baby Furniture', parent_id: baby_furniture.id)
children_furniture = Category.create(name: 'Children`s Furniture', parent_id: baby_furniture.id)
teen_furniture = Category.create(name: 'Teeb Furniture', parent_id: baby_furniture.id)

decor = Category.create(name: 'Decor', parent_id: decoration.id)
lighting = Category.create(name: 'Lighting', parent_id: decoration.id)
walldecor = Category.create(name: 'Walldecor', parent_id: decoration.id)
tableware = Category.create(name: 'Tableware', parent_id: decoration.id)

furniture_best_seller = Category.create(name: 'Furniture Best Sellers', parent_id: "#{ furniture.id },#{ decosy_best_seller.id }")
sofa_armchair = Category.create(name: 'Sofas & Armchairs', parent_id: "#{ furniture.id },#{ living_room.id }")
bar_counter = Category.create(name: 'Bars & Counters', parent_id: "#{ furniture.id },#{ dinning_room.id }")
bed = Category.create(name: 'Beds', parent_id: "#{ furniture.id },#{ bedroom.id }")
bathroom_shelf = Category.create(name: 'Bathroom Shelves', parent_id: "#{ furniture.id },#{ bathroom.id }")
kitchen_shelf = Category.create(name: 'Kitchen Shelves', parent_id: "#{ furniture.id },#{ kitchen.id }")
bookcase = Category.create(name: 'Bookcases', parent_id: "#{ furniture.id },#{ office.id }")