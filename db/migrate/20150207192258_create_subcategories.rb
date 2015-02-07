class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :description
      t.integer :category_id

      t.timestamps
    end
    add_index :subcategories, :description
    add_index :subcategories, :category_id
  end
end
