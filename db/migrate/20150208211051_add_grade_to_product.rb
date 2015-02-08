class AddGradeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :grade, :string
  end
end
