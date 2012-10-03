# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

assessments = Assessment.create([
  { score: 5, created_at:DateTime.new(2012,9,25), goal_id:2 },
  { score: 9, created_at:DateTime.new(2012,9,27), goal_id:2 },
  { score: 5, created_at:DateTime.new(2012,9,27), goal_id:2 },
  { score: 6, created_at:DateTime.new(2012,9,28), goal_id:2 },
  { score: 5, created_at:DateTime.new(2012,9,29), goal_id:2 },
  { score: 7, created_at:DateTime.new(2012,10,2), goal_id:2 }
])

