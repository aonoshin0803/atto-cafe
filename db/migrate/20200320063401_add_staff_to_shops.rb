class AddStaffToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :staff, :string
  end
end
