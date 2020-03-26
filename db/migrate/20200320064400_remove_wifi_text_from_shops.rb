class RemoveWifiTextFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :wifi_text, :text
  end
end
