class RemoveStaffTextToShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :staff_text, :text
  end
end
