# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Root categories
furniture = Category.create(name: 'Furniture', is_public: true, is_selected: true)
parent_baby_furniture = Category.create(name: 'Baby furniture', is_public: true, is_selected: true)
decoration = Category.create(name: 'Decoration', is_public: true, is_selected: true)

# furniture child's categories
living_room = Category.create(name: 'Living Room', parent_id: furniture.id.to_s, is_public: true)
dinning_room = Category.create(name: 'Dinning Room', parent_id: furniture.id.to_s, is_public: true)
bedroom = Category.create(name: 'Bedroom', parent_id: furniture.id.to_s, is_public: true)
bathroom = Category.create(name: 'Bathroom', parent_id: furniture.id.to_s, is_public: true)
kitchen = Category.create(name: 'Kitchen', parent_id: furniture.id.to_s, is_public: true)
office = Category.create(name: 'Office', parent_id: furniture.id.to_s, is_public: true)

# parent_baby_furniture child's categories
baby_furniture = Category.create(name: 'Baby Furniture', parent_id: parent_baby_furniture.id.to_s, is_public: true)
children_furniture = Category.create(name: 'Children`s Furniture', parent_id: parent_baby_furniture.id.to_s, is_public: true)
teen_furniture = Category.create(name: 'Teen Furniture', parent_id: parent_baby_furniture.id.to_s, is_public: true)

# decoration child's categories
decor = Category.create(name: 'Decor', parent_id: decoration.id.to_s, is_public: true)
lighting = Category.create(name: 'Lighting', parent_id: decoration.id.to_s, is_public: true)
walldecor = Category.create(name: 'Walldecor', parent_id: decoration.id.to_s, is_public: true)
tableware = Category.create(name: 'Tableware', parent_id: decoration.id.to_s, is_public: true)

# furniture grandchild's categories
Category.create(name: 'Sofas & Armchairs', parent_id: living_room.id.to_s, is_public: true)
Category.create(name: 'Shelves & Shelving units', parent_id: living_room.id.to_s, is_public: true)
Category.create(name: 'Bookcases', parent_id: living_room.id.to_s, is_public: true)
Category.create(name: 'Bars & Counters', parent_id: dinning_room.id.to_s, is_public: true)
Category.create(name: 'Benches', parent_id: dinning_room.id.to_s, is_public: true)
Category.create(name: 'Chairs', parent_id: dinning_room.id.to_s, is_public: true)
Category.create(name: 'Beds', parent_id: bedroom.id.to_s, is_public: true)
Category.create(name: 'Chests of drawers', parent_id: bedroom.id.to_s, is_public: true)
Category.create(name: 'Dressing tables', parent_id: bedroom.id.to_s, is_public: true)
Category.create(name: 'Bathroom Shelves', parent_id: bathroom.id.to_s, is_public: true)
Category.create(name: 'Laundry baskets', parent_id: bathroom.id.to_s, is_public: true)
Category.create(name: 'Towel hangers', parent_id: bathroom.id.to_s, is_public: true)
Category.create(name: 'Kitchen Shelves', parent_id: kitchen.id.to_s, is_public: true)
Category.create(name: 'Bars & Counters', parent_id: kitchen.id.to_s, is_public: true)
Category.create(name: 'Kitchen units & Islands', parent_id: kitchen.id.to_s, is_public: true)
Category.create(name: 'Office units', parent_id: office.id.to_s, is_public: true)
Category.create(name: 'Desks', parent_id: office.id.to_s, is_public: true)

# parent_baby_furniture grandchild's categories
Category.create(name: 'Baby Tables & Chairs', parent_id: baby_furniture.id.to_s, is_public: true)
Category.create(name: 'Baby Changing tables & Closets', parent_id: baby_furniture.id.to_s, is_public: true)
Category.create(name: 'Baby Cots & Beds', parent_id: baby_furniture.id.to_s, is_public: true)
Category.create(name: 'Children Beds', parent_id: children_furniture.id.to_s, is_public: true)
Category.create(name: 'Children Bookcases & Shelves', parent_id: children_furniture.id.to_s, is_public: true)
Category.create(name: 'Children Outdoor furniture', parent_id: children_furniture.id.to_s, is_public: true)
Category.create(name: 'Teen Beds', parent_id: teen_furniture.id.to_s, is_public: true)
Category.create(name: 'Teen Bookcases & Shelves', parent_id: teen_furniture.id.to_s, is_public: true)
Category.create(name: 'Teen Drawers & Closets', parent_id: teen_furniture.id.to_s, is_public: true)

# decoration grandchild's categories
Category.create(name: 'Bathroom accessories', parent_id: decor.id.to_s, is_public: true)
Category.create(name: 'Candles & Home fragances', parent_id: decor.id.to_s, is_public: true)
Category.create(name: 'Lanterns', parent_id: decor.id.to_s, is_public: true)
Category.create(name: 'Magazine racks', parent_id: decor.id.to_s, is_public: true)
Category.create(name: 'Rugs & Mats', parent_id: decor.id.to_s, is_public: true)
Category.create(name: 'Pendant Lamps', parent_id: lighting.id.to_s, is_public: true)
Category.create(name: 'Decorative lights & Fairy lights', parent_id: lighting.id.to_s, is_public: true)
Category.create(name: 'Clocks', parent_id: walldecor.id.to_s, is_public: true)
Category.create(name: 'Mirrors', parent_id: walldecor.id.to_s, is_public: true)
Category.create(name: 'Photo memo boards', parent_id: walldecor.id.to_s, is_public: true)
Category.create(name: 'Wall Art & Prints', parent_id: walldecor.id.to_s, is_public: true)
Category.create(name: 'Trays', parent_id: tableware.id.to_s, is_public: true)
Category.create(name: 'Racks & Baskets', parent_id: tableware.id.to_s, is_public: true)
Category.create(name: 'Glasses & Carafes', parent_id: tableware.id.to_s, is_public: true)

# root additional categories
trendy = Category.create(name: 'Trendy', is_public: true)
new_furniture = Category.create(name: 'New furniture', is_public: true)