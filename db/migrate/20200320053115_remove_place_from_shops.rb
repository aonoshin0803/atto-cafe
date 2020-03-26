class RemovePlaceFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :place, :integer
  end
end
