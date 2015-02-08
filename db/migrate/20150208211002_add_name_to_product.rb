class AddNameToProduct < ActiveRecord::Migration
  def change
    add_column :products, :pname, :string
  end
end
