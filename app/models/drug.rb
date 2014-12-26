class Drug < ActiveRecord::Base

	validates :name, presence: true, uniqueness: { case_sensitive: false }
		
	has_many :relationships
	has_many :ingredients, :through => :relationships

end
