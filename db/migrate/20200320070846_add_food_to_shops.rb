class AddFoodToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :food, :string
  end
end
