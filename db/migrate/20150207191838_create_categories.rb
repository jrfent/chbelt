class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :description

      t.timestamps
    end
    add_index :categories, :description
  end
end
