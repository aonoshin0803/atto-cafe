class AddQuietnessToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :quietness, :string
  end
end
