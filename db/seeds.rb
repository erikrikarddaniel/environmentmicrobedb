# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
project = Project.create([{name: 'Project1'},{name: 'Project2'},{name: 'Project3'}])
project[0].properties.create([{name: 'proj_prop1',value: 'proj_prop_value1'},{name: 'proj_prop2',value: 'proj_prop_value2'}])
project[1].properties.create([{name: 'proj_prop1',value: 'proj_prop_value1'},{name: 'proj_prop2',value: 'proj_prop_value2'}])
project[2].properties.create([{name: 'proj_prop3',value: 'proj_prop_value1'},{name: 'proj_prop3',value: 'proj_prop_value2'}])
