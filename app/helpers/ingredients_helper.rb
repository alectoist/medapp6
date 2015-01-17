module IngredientsHelper

def ingredient_partial
	
	if @ingredient.allowed == "no"
		render 'ingredient_red'

	elsif @ingredient.allowed == "warning"
		render 'ingredient_yellow'
	
	elsif @ingredient.allowed == "yes"		
		render 'ingredient_green'

	end

end
	

end
