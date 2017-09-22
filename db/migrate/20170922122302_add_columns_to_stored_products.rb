class AddColumnsToStoredProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :stored_products, :original_language, :string
  	add_column :stored_products, :materials_available, :string
  	add_column :stored_products, :rights_available, :string
  	add_column :stored_products, :age_range, :string
  end
end
