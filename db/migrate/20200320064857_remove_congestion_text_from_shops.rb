class RemoveCongestionTextFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :congestion_text, :text
  end
end
