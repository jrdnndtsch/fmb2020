class AddAgeRangeOtherToStoredProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :stored_products, :age_range_other, :string
  end
end
