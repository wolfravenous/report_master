# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bio = Subject.create(:name => "Biology")
bio.units.create(:title => "01-The Science of Life", :content => "This would be valid content.")
bio.units.create(:title => "02-The Chemistry of Life", :content => "This would be valid content.")
bio.units.create(:title => "03-The Biosphere", :content => "This would be valid content.")



#
# Subject.create(name: "Biology")
# Subject.create(name: "Chemistry")
#
# Unit.create(title: "01-The Science of Life", subject_id: Subject.find_by(name: "Biology").id)
# Unit.create(title: "03-The Biosphere", subject_id: Subject.find_by(name: "Biology").id)
# Unit.create(title: "02-Matter and Change", subject_id: Subject.find_by(name: "Chemistry").id)
# Unit.create(title: "04-Atomic Structure", subject_id: Subject.find_by(name: "Chemistry").id)
