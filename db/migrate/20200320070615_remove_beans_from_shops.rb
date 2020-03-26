class RemoveBeansFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :beans, :integer
  end
end
