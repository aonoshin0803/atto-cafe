class AddBeansToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :beans, :string
  end
end
