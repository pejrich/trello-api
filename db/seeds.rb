# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all

project = Project.new
project.token = 1
project.name = "First Project"
project.save

bucket = project.buckets.create
bucket.name = "Test Bucket 1"
bucket.save
task = bucket.tasks.create
task.name = "Test Task 1-1"
task.save
task = bucket.tasks.create
task.name = "Test Task 1-2"
task.save

bucket = project.buckets.create
bucket.name = "Test Bucket 2"
bucket.save
task = bucket.tasks.create
task.name = "Test Task 2-1"
task.save
task = bucket.tasks.create
task.name = "Test Task 2-2"
task.save