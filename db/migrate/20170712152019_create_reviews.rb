class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :quote
      t.string :citation
      t.string :publication
      t.references :stored_product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
