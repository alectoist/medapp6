module DrugsHelper

	def allowed?
		allowed_array = Ingredient.where(id: Relationship.where(drug_id: @drug.id).all.map(&:ingredient_id)).all.map(&:allowed)  

		if allowed_array.include?("no") && allowed_array.include?("warning")
			return "not allowed"

		elsif allowed_array.include?("no")
			return "not allowed"

		elsif allowed_array.include?("warning")
			return "warning"

		else
			return "allowed"

		end
	end

	def code_switch

		if allowed? == "not allowed"
			render 'red'

		elsif allowed? == "warning"
			render 'yellow'

		elsif allowed? == "allowed"
			render 'green'

		else
			return ''	

		end

	end


	def active_ingredients
		
		Relationship.where(drug_id: @drug.id).each do |relationship|
		
		link_to Ingredient.find_by(id: relationship.ingredient_id ).name, Ingredient.find_by(id: relationship.ingredient_id )
		
		end

	end
	
end
