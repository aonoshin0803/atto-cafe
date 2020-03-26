class RemoveFoodFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :food, :integer
  end
end
