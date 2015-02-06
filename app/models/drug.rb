class Drug < ActiveRecord::Base

	validates :name, presence: true, uniqueness: { case_sensitive: false }
		
	has_many :relationships, :dependent => :destroy
	has_many :ingredients, :through => :relationships

	accepts_nested_attributes_for :relationships, :allow_destroy => true

	searchable do
		text :name, boost: 5
		text :description
	end

end
