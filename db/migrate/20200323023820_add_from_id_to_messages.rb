class AddFromIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :from_id, :integer
  end
end
