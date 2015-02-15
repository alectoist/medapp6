class Drug < ActiveRecord::Base

	validates :name, presence: true, uniqueness: { case_sensitive: false }
		
	has_many :relationships, :foreign_key => :drug_id, :dependent => :destroy
	has_many :ingredients, :through => :relationships

	searchable do
		text :name, boost: 5
		text :description
	end
	
end
