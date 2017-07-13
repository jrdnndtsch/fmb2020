class RenameCreatorsTypeToCreatorType < ActiveRecord::Migration[5.0]
  def change
  	rename_column :creators, :type, :creator_type
  end
end
