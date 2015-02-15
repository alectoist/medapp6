class Relationship < ActiveRecord::Base

	belongs_to :drug, :foreign_key => :drug_id
	belongs_to :ingredient, :foreign_key => :ingredient_id

	validates :drug_id, presence: true
	validates :ingredient_id, presence: true

	def make_relationship!(drug, ingredient)
		Relationship.create!(drug_id: drug.id, ingredient_id: ingredient.id)
	end

end
