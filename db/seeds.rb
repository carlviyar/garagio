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

car = Car.create(customer: chad, make: "Toyota", model: "Prius")

# Ingests from CSV to seed vehicle_info db
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
chad = Customer.create(name: "Chad", email: "chad.palmer@yale.edu")
jonas = Customer.create(name: "Jonas", email: "jonas@yale.edu")
carl = Customer.create(name: "Carl", email: "carl@yale.edu")
nico = Customer.create(name: "Nico", email: "nico@yale.edu")

prius = Car.create(customer: chad, make: "Toyota", model: "Prius", year: 2007)
bugatti = Car.create(customer: chad, make: "Bugatti", model: "Veyron", year: 2011)

carguys = ShopOwner.create(shop_name: "Car Guys", email: "car_guys@gmail.com", address: "90 Prospect St, New Haven, CT 06511")
jeffcars = ShopOwner.create(shop_name: "Jeff Cars", email: "jeff_cars@gmail.com", address: "304 York St, New Haven, CT 06511")

a1 = Appointment.create(shop_owner: carguys, customer: chad, car: prius, date: DateTime.now, car_issue: "ac broke")

r1 = Review.create(shop_owner: carguys, customer: chad, rating: 5, assessment: "fixed issue quickly and correctly!")
