class CreateSubTags < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_tags do |t|
      t.string :name
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
