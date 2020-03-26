class AddPlaceToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :place, :string
  end
end
