class RemoveCongestionFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :congestion, :integer
  end
end
