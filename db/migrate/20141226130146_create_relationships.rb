class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :drug_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
