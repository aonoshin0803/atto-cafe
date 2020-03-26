class RemoveQuietnessFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :quietness, :integer
  end
end
