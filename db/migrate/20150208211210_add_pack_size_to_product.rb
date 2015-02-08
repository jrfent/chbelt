class AddPackSizeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :pack_size, :string
  end
end
