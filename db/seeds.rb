# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Customer.destroy_all
Car.destroy_all
ShopOwner.destroy_all
Appointment.destroy_all
Review.destroy_all
VehicleInfo.destroy_all

chad = Customer.create(name: "Chad Palmer", email: "chad.palmer@yale.edu", phone: "(123) 456-7890")
jonas = Customer.create(name: "Jonas Kavaliauskas", email: "jonas.kavaliauskas@yale.edu", phone: "(123) 456-7890")
carl = Customer.create(name: "Carl Viyar", email: "carl.viyar@yale.edu", phone: "(123) 456-7890")
nico = Customer.create(name: "Nico Burbano", email: "nico.burbano@yale.edu", phone: "(123) 456-7890")

prius = Car.create(customer: chad, make: "Toyota", model: "Prius", year: 2007, body_style: "Hatchback")
bugatti = Car.create(customer: jonas, make: "Bugatti", model: "Veyron", year: 2011, body_style: "Roadster")
tesla1 = Car.create(customer: carl, make: "Tesla", model: "Model S", year: 2020, body_style: "Sedan")
tesla2 = Car.create(customer: nico, make: "Tesla", model: "Model 3", year: 2021, body_style: "Sedan")

carguys = ShopOwner.create(shop_name: "Car Guys", email: "car_guys@gmail.com", address: "90 Prospect St, New Haven, CT 06511")
jeffcars = ShopOwner.create(shop_name: "Jeff's Cars", email: "jeffs_cars@gmail.com", address: "304 York St, New Haven, CT 06511")
distantshop = ShopOwner.create(shop_name: "Distant Shop, Inc.", email: "distant_shop@gmail.com", address: "110 Willow St, Meriden, CT 06450")
terrystires = ShopOwner.create(shop_name: "Terry's Tires", email: "terrys_tires@gmail.com", address: "129 Plains Rd, Milford, CT 06460")

Appointment.create(shop_owner: carguys, customer: chad, car: prius, date: DateTime.new(2021,4,1,5,30), car_issue: "ac broke")
Appointment.create(shop_owner: carguys, customer: jonas, car: bugatti, date: DateTime.new(2021,4,6,2,30), car_issue: "car smells")
Appointment.create(shop_owner: carguys, customer: carl, car: tesla1, date: DateTime.new(2021,4,4,4,6), car_issue: "car broke")
Appointment.create(shop_owner: carguys, customer: nico, car: tesla2, date: DateTime.new(2021,4,15,4,6), car_issue: "weird noise")

Appointment.create(shop_owner: jeffcars, customer: chad, car: prius, date: DateTime.new(2021,4,1,5,30), car_issue: "ac broke")
Appointment.create(shop_owner: jeffcars, customer: jonas, car: bugatti, date: DateTime.new(2021,4,6,2,30), car_issue: "car smells")
Appointment.create(shop_owner: jeffcars, customer: carl, car: tesla1, date: DateTime.new(2021,4,4,4,6), car_issue: "car broke")
Appointment.create(shop_owner: jeffcars, customer: nico, car: tesla2, date: DateTime.new(2021,4,15,4,6), car_issue: "weird noise")
    
Review.create(shop_owner: carguys, customer: chad, rating: 3, assessment: "fixed issue quickly and correctly!")
Review.create(shop_owner: carguys, customer: jonas, rating: 2, assessment: "destroyed my vehicle")
Review.create(shop_owner: carguys, customer: nico, rating: 2, assessment: "my car smells a lot better now")
Review.create(shop_owner: carguys, customer: carl, rating: 2, assessment: "the owner was very impolite")

Review.create(shop_owner: jeffcars, customer: chad, rating: 3, assessment: "fixed issue quickly and correctly!")
Review.create(shop_owner: jeffcars, customer: jonas, rating: 3, assessment: "destroyed my vehicle")
Review.create(shop_owner: jeffcars, customer: carl, rating: 5, assessment: "the owner was very impolite")

Review.create(shop_owner: distantshop, customer: nico, rating: 3.5, assessment: "fixed issue quickly and correctly!")
Review.create(shop_owner: terrystires, customer: chad, rating: 2, assessment: "fixed issue quickly and correctly!")

# Ingests from CSV to seed vehicle_info db
if VehicleInfo.all.count == 0
    csv_text = File.read(Rails.root.join('db', 'lib', 'seeds', 'vehicle_info_seed.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
        t = VehicleInfo.new
        t.year = row['year']
        t.make = row['make']
        t.model = row['model']
        t.body_styles = row['body_styles']
        t.save
    end
end
