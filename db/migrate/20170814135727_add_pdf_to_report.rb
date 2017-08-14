class AddPdfToReport < ActiveRecord::Migration[5.0]
  def up
  	add_attachment :reports, :pdf
  end

  def down
    remove_attachment :reports, :pdf
  end
end
