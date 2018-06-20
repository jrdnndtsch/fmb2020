class AddValuesToStoredProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :stored_products, :submitted_by_first_name, :string
  	add_column :stored_products, :submitted_by_last_name, :string
  	add_column :stored_products, :submitted_by_email, :string
  end
end
