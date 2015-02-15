class Ingredient < ActiveRecord::Base

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :allowed, presence: true
	
	has_many :relationships, :foreign_key => :ingredient_id, :dependent => :destroy
	has_many :drugs, :through => :relationships
	
	searchable do
		text :name, boost: 5
		text :description
	end
	
end
