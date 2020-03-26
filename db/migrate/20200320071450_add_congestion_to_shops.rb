class AddCongestionToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :congestion, :string
  end
end
