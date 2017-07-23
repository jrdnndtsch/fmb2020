class AddValuesToStoredProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :stored_products, :page_number, :integer
    add_column :stored_products, :publication_date, :datetime
    add_column :stored_products, :publication_location, :string
    add_column :stored_products, :rights_sold, :boolean, default: true
    add_column :stored_products, :age_range_start, :integer
    add_column :stored_products, :age_range_end, :integer
  end
end
