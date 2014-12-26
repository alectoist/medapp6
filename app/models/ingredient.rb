class Ingredient < ActiveRecord::Base

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :allowed, presence: true
	
	has_many :relationships
	has_many :drugs, :through => :relationships
	
end
