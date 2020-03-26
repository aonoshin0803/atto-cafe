class RemoveQuietnessTextFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :quietness_text, :text
  end
end
