class CreateStoredProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :stored_products do |t|
      t.string :title
      t.string :body_html
      t.string :vendor
      t.string :product_type
      t.boolean :published, :default => false

      t.timestamps
    end
  end
end
