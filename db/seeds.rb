# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
furniture = Category.create(name: 'Furniture', is_public: true)
baby_furniture = Category.create(name: 'Baby furniture', is_public: true)
decoration = Category.create(name: 'Decoration', is_public: true)

decosy_best_seller = Category.create(name: 'Decosy Best Sellers', parent_id: furniture.id, is_public: true)
living_room = Category.create(name: 'Living Room', parent_id: furniture.id, is_public: true)
dinning_room = Category.create(name: 'Dinning Room', parent_id: furniture.id, is_public: true)
bedroom = Category.create(name: 'Bedroom', parent_id: furniture.id, is_public: true)
bathroom = Category.create(name: 'Bathroom', parent_id: furniture.id, is_public: true)
kitchen = Category.create(name: 'Kitchen', parent_id: furniture.id, is_public: true)
office = Category.create(name: 'Office', parent_id: furniture.id, is_public: true)

baby_best_seller = Category.create(name: 'Best Sellers', parent_id: baby_furniture.id, is_public: true)
baby_furniture = Category.create(name: 'Baby Furniture', parent_id: baby_furniture.id, is_public: true)
children_furniture = Category.create(name: 'Children`s Furniture', parent_id: baby_furniture.id, is_public: true)
teen_furniture = Category.create(name: 'Teeb Furniture', parent_id: baby_furniture.id, is_public: true)

decor = Category.create(name: 'Decor', parent_id: decoration.id, is_public: true)
lighting = Category.create(name: 'Lighting', parent_id: decoration.id, is_public: true)
walldecor = Category.create(name: 'Walldecor', parent_id: decoration.id, is_public: true)
tableware = Category.create(name: 'Tableware', parent_id: decoration.id, is_public: true)

furniture_best_seller = Category.create(name: 'Furniture Best Sellers', parent_id: "#{ furniture.id },#{ decosy_best_seller.id }", is_public: true)
sofa_armchair = Category.create(name: 'Sofas & Armchairs', parent_id: "#{ furniture.id },#{ living_room.id }", is_public: true)
bar_counter = Category.create(name: 'Bars & Counters', parent_id: "#{ furniture.id },#{ dinning_room.id }", is_public: true)
bed = Category.create(name: 'Beds', parent_id: "#{ furniture.id },#{ bedroom.id }", is_public: true)
bathroom_shelf = Category.create(name: 'Bathroom Shelves', parent_id: "#{ furniture.id },#{ bathroom.id }", is_public: true)
kitchen_shelf = Category.create(name: 'Kitchen Shelves', parent_id: "#{ furniture.id },#{ kitchen.id }", is_public: true)
bookcase = Category.create(name: 'Bookcases', parent_id: "#{ furniture.id },#{ office.id }", is_public: true)

trendy = Category.create(name: 'Trendy', is_public: true)
new_furniture = Category.create(name: 'New furniture', is_public: true)

product = Product.create(name: 'BIPLANE - Red table clock', price: 900000, description: "Add a touch of fun decoration to a room with this Biplane in metal. It'll look great anywhere and surely add up to your decoration! Your kid will love it, but you might love it more yourself. So which room its going to go ?",
  dimension_x: 24, dimension_y: 20, dimension_z: 15, is_public: true)

color_1 = Color.create(name: "Natural beech", code: "#efe6c8")
color_2 = Color.create(name: "White", code: "#fff")
material_1 = Material.create(name: "Acacia")
material_2 = Material.create(name: "Beech wood")

product.category_products.create(category_id: trendy.id)
product.category_products.create(category_id: new_furniture.id)
product.category_products.create(category_id: decosy_best_seller.id)
product.color_products.create(color_id: color_1.id)
product.color_products.create(color_id: color_2.id)
product.material_products.create(material_id: material_1.id)
product.material_products.create(material_id: material_2.id)