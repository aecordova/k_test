# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Assistant.create(name: 'Lupe', address: 'Some Address #1', phone: '111 111 1111', group: 'one')

Activity.create(name: 'eat', description: 'baby is eating')
Activity.create(name: 'play', description: 'baby is playing')
Activity.create(name: 'sleep', description: 'baby is sleeping')

Baby.create(name: 'Lupito', birthday: Date.new(2020,2,3), mother_name: 'Juanita', father_name: 'Juanito', address: 'baby street 111, babycity, babyland', phone: '555 555 5555');

now = Time.now()

ActivityLog.create( baby_id: 1,  assistant_id: 1,  activity_id: 1,  start_time: now,  name: 'Act 1')
