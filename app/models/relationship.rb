class Relationship < ActiveRecord::Base

	belongs_to :drug
	belongs_to :ingredient

	validates :drug_id, presence: true
	validates :ingredient_id, presence: true

	def make_relationship!(drug, ingredient)
		Relationship.create!(drug_id: drug.id, ingredient_id: ingredient.id)
	end

end
