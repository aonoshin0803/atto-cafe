class AddToIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :to_id, :integer
  end
end
