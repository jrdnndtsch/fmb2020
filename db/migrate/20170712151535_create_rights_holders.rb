class CreateRightsHolders < ActiveRecord::Migration[5.0]
  def change
    create_table :rights_holders do |t|
      t.string :name
      t.string :website
      t.string :email
      t.references :stored_product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
