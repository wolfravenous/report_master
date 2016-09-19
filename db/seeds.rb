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

bio.intros.create(:title => "Welcome", :content => "This would be content for a welcome introduction.")
bio.intros.create(:title => "Regular", :content => "This would be content for a regular introduction.")


chem = Subject.create(:name => "Chemistry")

chem.units.create(:title => "01-Introduction to Chemistry", :content => "This would be valid content.")
chem.units.create(:title => "02-Matter and Change", :content => "This would be valid content.")
chem.units.create(:title => "03-Scientific Measurement", :content => "This would be valid content.")

chem.intros.create(:title => "Regular", :content => "This would be content for a regular introduction.")
chem.intros.create(:title => "Concluding", :content => "This would be content for a concluding introduction.")


Report.create(:name => "Jimmy Jones", :comment => "Some personal Comments", :gender => "male", :classwork => "35", :assessment => "36", :participate => "37", :subject_id => 1, :unit_id => 1)


Report.create(:name => "Susie Stone", :comment => "Some personal Comments", :gender => "female", :classwork => "53", :assessment => "54", :participate => "55", :subject_id => 2, :unit_id => 2)
#
# Subject.create(name: "Biology")
# Subject.create(name: "Chemistry")
#
# Unit.create(title: "01-The Science of Life", subject_id: Subject.find_by(name: "Biology").id)
# Unit.create(title: "03-The Biosphere", subject_id: Subject.find_by(name: "Biology").id)
# Unit.create(title: "02-Matter and Change", subject_id: Subject.find_by(name: "Chemistry").id)
# Unit.create(title: "04-Atomic Structure", subject_id: Subject.find_by(name: "Chemistry").id)
