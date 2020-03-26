class AddShopIdToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :shop_id, :integer
  end
end
