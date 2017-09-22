class RemoveDefaultFromRightsSold < ActiveRecord::Migration[5.0]
 def change
   change_column_default :stored_products, :rights_sold, nil
 end
end
