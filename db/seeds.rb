# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Parent.create [
  {id: 1, name: "Jason"}
]

Child.create [
  {id: 1, parent_id: 1, name: "Austin"}
]

Chore.create [
  {id: 1, child_id: 1, name: "Feeding", rate: 2, notes: "Includes cleaning water buckets on Wednesdays"},
  {id: 2, child_id: 1, name: "Dishes", rate: 2},
  {id: 3, child_id: 1, name: "Dusting", rate: 2},
  {id: 4, child_id: 1, name: "Trash", rate: 1},
  {id: 5, child_id: 1, name: "Vacuuming", rate: 2}
]

CompletedChore.create [
  {child_id: 1, chore_id: 1, completed_on: 4.days.ago},
  {child_id: 1, chore_id: 1, completed_on: 3.days.ago},
  {child_id: 1, chore_id: 1, completed_on: 2.days.ago},
  {child_id: 1, chore_id: 1, completed_on: 1.days.ago},
  {child_id: 1, chore_id: 2, completed_on: 4.days.ago},
  {child_id: 1, chore_id: 2, completed_on: 2.days.ago},
  {child_id: 1, chore_id: 2, completed_on: 1.days.ago},
  {child_id: 1, chore_id: 3, completed_on: 1.days.ago},
  {child_id: 1, chore_id: 4, completed_on: 4.days.ago},
  {child_id: 1, chore_id: 4, completed_on: 2.days.ago},
  {child_id: 1, chore_id: 4, completed_on: 1.days.ago},
  {child_id: 1, chore_id: 4, completed_on: Time.current},
  {child_id: 1, chore_id: 5, completed_on: 3.days.ago},
  {child_id: 1, chore_id: 5, completed_on: 1.days.ago}
]
