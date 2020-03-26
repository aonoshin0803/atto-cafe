class RemoveFoodTextFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :food_text, :text
  end
end
