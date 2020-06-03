# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

f_address = Faker::Address
f_name = Faker::Name
f_phone = Faker::PhoneNumber
f_anum = Faker::Alphanumeric
f_date = Faker::Date
f_time = Faker::Time
f_activity = Faker::Verb
f_lorem = Faker::Lorem
f_number = Faker::Number
f_number = Faker::Number

10.times do
  address = [f_address.street_address,' ', f_address.street_suffix,', ', f_address.city,  f_address.city_suffix, ', ',f_address.state_abbr].join 

  Assistant.create(name: f_name.name, address: address , phone: f_phone.cell_phone, group: f_anum.alpha(number: 10))

  female_name = [f_name.female_first_name, f_name.last_name].join(' ')
  male_name = [f_name.male_first_name, f_name.last_name].join(' ')
  birthday = f_date.between(from: 4.years.ago, to: Date.today())

  Baby.create(name: f_name.name, mother_name: female_name, father_name: male_name, address: address, phone: f_phone.cell_phone, birthday: birthday)

  Activity.create(name: f_activity.base, description: f_lorem.sentence(word_count: 4))

  s_time = f_time.backward(days: 30)
  
  ActivityLog.create(baby_id: f_number.between(from: 1, to: Baby.count),
                     assistant_id: f_number.between(from: 1, to: Assistant.count), 
                     activity_id: f_number.between(from: 1, to: Activity.count),
                     comments: f_lorem.sentence(word_count: 4),
                     start_time:s_time)
end

