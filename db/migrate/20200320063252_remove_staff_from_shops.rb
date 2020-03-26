class RemoveStaffFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :staff, :integer
  end
end
