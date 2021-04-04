# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
furniture = Category.create(name: 'Furniture', is_public: true)
parent_baby_furniture = Category.create(name: 'Baby furniture', is_public: true)
decoration = Category.create(name: 'Decoration', is_public: true)

decosy_best_seller = Category.create(name: 'Decosy Best Sellers', parent_id: furniture.id.to_s, is_public: true)
living_room = Category.create(name: 'Living Room', parent_id: furniture.id.to_s, is_public: true)
dinning_room = Category.create(name: 'Dinning Room', parent_id: furniture.id.to_s, is_public: true)
bedroom = Category.create(name: 'Bedroom', parent_id: furniture.id.to_s, is_public: true)
bathroom = Category.create(name: 'Bathroom', parent_id: furniture.id.to_s, is_public: true)
kitchen = Category.create(name: 'Kitchen', parent_id: furniture.id.to_s, is_public: true)
office = Category.create(name: 'Office', parent_id: furniture.id.to_s, is_public: true)

baby_best_seller = Category.create(name: 'Best Sellers', parent_id: parent_baby_furniture.id.to_s, is_public: true)
baby_furniture = Category.create(name: 'Baby Furniture', parent_id: parent_baby_furniture.id.to_s, is_public: true)
children_furniture = Category.create(name: 'Children`s Furniture', parent_id: parent_baby_furniture.id.to_s, is_public: true)
teen_furniture = Category.create(name: 'Teeb Furniture', parent_id: parent_baby_furniture.id.to_s, is_public: true)

decor = Category.create(name: 'Decor', parent_id: decoration.id.to_s, is_public: true)
lighting = Category.create(name: 'Lighting', parent_id: decoration.id.to_s, is_public: true)
walldecor = Category.create(name: 'Walldecor', parent_id: decoration.id.to_s, is_public: true)
tableware = Category.create(name: 'Tableware', parent_id: decoration.id.to_s, is_public: true)

furniture_best_seller = Category.create(name: 'Furniture Best Sellers', parent_id: decosy_best_seller.id.to_s, is_public: true)
sofa_armchair = Category.create(name: 'Sofas & Armchairs', parent_id: living_room.id.to_s, is_public: true)
bar_counter = Category.create(name: 'Bars & Counters', parent_id: dinning_room.id.to_s, is_public: true)
bed = Category.create(name: 'Beds', parent_id: bedroom.id.to_s, is_public: true)
bathroom_shelf = Category.create(name: 'Bathroom Shelves', parent_id: bathroom.id.to_s, is_public: true)
kitchen_shelf = Category.create(name: 'Kitchen Shelves', parent_id: kitchen.id.to_s, is_public: true)
bookcase = Category.create(name: 'Bookcases', parent_id: office.id.to_s, is_public: true)

trendy = Category.create(name: 'Trendy', is_public: true)
new_furniture = Category.create(name: 'New furniture', is_public: true)

product = Product.create(name: 'BIPLANE - Red table clock', price: 900000, description: "Add a touch of fun decoration to a room with this Biplane in metal. It'll look great anywhere and surely add up to your decoration! Your kid will love it, but you might love it more yourself. So which room its going to go ?",
  dimension_x: 24, dimension_y: 20, dimension_z: 15, is_public: true, color: 'Red', material: 'Wood')

user = User.create(email: 'user@example.com', role: 'user', full_name: 'User', phone: '123456789', address: '39 Nguyễn Thị Diệu p5 q3', age: '28', gender: 'male', password: '12345678')
admin = User.create(email: 'admin@example.com', role: 'admin', full_name: 'Admin', age: '28', gender: 'male', password: '12345678')