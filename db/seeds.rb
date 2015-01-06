# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
  {username: 'test',
   email: 'test@test.com',
   password: 'password', 
   password_confirmation: 'password'},
])

AdminUser.create({
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
})

Map.create([
  {name: 'surf_kitsune', url: 'http://steamworkshop.com/maps/surf_kitsune', tier: 1, map_type: 'stages'},
  {name: 'surf_classics', url: 'http://steamworkshop.com/maps/surf_kitsune', tier: 1, map_type: 'stages'},
  {name: 'surf_syria', url: 'http://steamworkshop.com/maps/surf_kitsune', tier: 2, map_type: 'linear'},
  {name: 'surf_utopia_v3', url: 'http://steamworkshop.com/maps/surf_kitsune', tier: 2, map_type: 'linear'},
  {name: 'surf_mesa', url: 'http://steamworkshop.com/maps/surf_kitsune', tier: 1, map_type: 'linear'},
])

