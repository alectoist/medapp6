class AddUniqueness < ActiveRecord::Migration
  def change
  	add_index :drugs, :name, unique: true
  	add_index :ingredients, :name, unique: true
  end
end
