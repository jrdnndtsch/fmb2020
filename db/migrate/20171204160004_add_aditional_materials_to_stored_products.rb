class AddAditionalMaterialsToStoredProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :stored_products, :additional_materials, :string
  end
end
