namespace :db do

desc "Populate db with sample data"
	task populate: :environment do
		make_drugs
		make_ingredients
		
	end
end



def make_drugs
	50.times do |n|
	name = "drug_name-#{n+1}"
	description = Faker::Lorem.paragraph(2)
	Drug.create!(name: name, description: description)
	end
end

def make_ingredients
	ingredients = ["acetaminophen", "alcloxa", "bemotrizinol", "bithionol", "polycarbophil", "carbonate", "aqua", "dioxibrate", "hydrogenium"]
	for i in 0..8
	name = ingredients[i]
	allowed = ["yes", "warning", "no"].sample
	description = Faker::Lorem.paragraph(2)
	Ingredient.create!(name: name, allowed: allowed, description: description)
	end

end


