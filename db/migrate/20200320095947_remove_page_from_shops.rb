class RemovePageFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :page, :string
  end
end
