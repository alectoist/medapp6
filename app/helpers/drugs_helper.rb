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

end
