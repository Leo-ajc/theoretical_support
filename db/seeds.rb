# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.create([
  { description: 'Waiting for Staff Response'},
  { description: 'Waiting for Customer'},
  { description: 'On Hold'},
  { description: 'Open'},
  { description: 'Cancelled'},
  { description: 'Completed'}
])

Department.create([
  { name: 'billing' },
  { name: 'accounts' },
  { name: 'hosting' },
  { name: 'database' }
])

