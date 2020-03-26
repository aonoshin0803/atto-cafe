class RemoveWideFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :wide, :integer
  end
end
