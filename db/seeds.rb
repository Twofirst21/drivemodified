# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#    	t.string :model
#    	t.string :brand
#    	t.integer :price
#   	t.integer :cylinders
#    	t.integer :horsepower
#    	t.integer :torque
#    	t.integer :mileage
#      t.text :description
#      t.references :user, foreign_key: true
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting database..."

Car.delete_all
User.delete_all

user = User.create(email: Faker::Internet.email)

CARS = {
	nissan_gtr: "http://libertywalk-eu.com/wp-content/uploads/2015/11/blog_06062014_libertywalk_gtr_pur_11.jpg"
	ford_mustang: "https://i.ytimg.com/vi/inM6ypAuu-Q/maxresdefault.jpg"
	toyota_supra: "https://i.ytimg.com/vi/p4fY0JozL9M/maxresdefault.jpg"
	volkswagen_gti: "https://s1.cdn.autoevolution.com/images/news/gallery/golf-6-gti-gets-widebody-kit-from-ingo-noak-the-european-rocket-bunny_2.jpg"
	lamborghini_huracan: "https://storage.googleapis.com/gtspirit/uploads/2015/11/Lamborghini-Huracan-Liberty-Walk-1.jpg"
	ferrari_458: "https://www.musclecarszone.com/wp-content/uploads/2016/02/prior-design-wide-body-kits-ferrari-458-italia-cover.jpg"

}

Car.new = [
	{brand_model: 'Nissan GTR', price: 1000, cylinders: 6, horsepower: 1500, torque: 1250, mileage: 12000, description: Faker::Lorem.paragraph},
	{brand_model: 'Ford Mustang', price: 500, cylinders: 8, horsepower: 700, torque: 680, mileage: 32000, description: Faker::Lorem.paragraph},
	{brand_model: 'Toyota Supra', price: 900, cylinders: 6, horsepower: 1000, torque: 950, mileage: 78000, description: Faker::Lorem.paragraph},
	{brand_model: 'Volkswagen GTI', price: 400, cylinders: 6, horsepower: 400, torque: 400, mileage: 29000, description: Faker::Lorem.paragraph},
	{brand_model: 'Lamborghini Huracan', price: 2200, cylinders: 10, horsepower: 1000, torque: 1000, mileage: 3000, description: Faker::Lorem.paragraph},
	{brand_model: 'Ferrari 458 Italia', price: 2100, cylinders: 8, horsepower: 700, torque: 580, mileage: 8000, description: Faker::Lorem.paragraph}
]
car.user = user
car.photo_url = CARS[car.brand_model.to_sym]
car.save!

puts 'Finished!'