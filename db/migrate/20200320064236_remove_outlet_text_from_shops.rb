class RemoveOutletTextFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :outlet_text, :text
  end
end
