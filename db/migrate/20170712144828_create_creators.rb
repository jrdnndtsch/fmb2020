class CreateCreators < ActiveRecord::Migration[5.0]
  def change
    create_table :creators do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.references :stored_product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
