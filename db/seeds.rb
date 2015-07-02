# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
phone_manufacturer = PhoneManufacturer.find_or_create_by!(name: "Motorola", country: "USA")
Phone.find_or_create_by!(phone_manufacturer_id: phone_manufacturer.id, year: 2003, battery_life: "8 hours", description: "Blah")
