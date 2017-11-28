class Review < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :link, :string
  end
end
