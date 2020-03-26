class AddWideToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :wide, :string
  end
end
