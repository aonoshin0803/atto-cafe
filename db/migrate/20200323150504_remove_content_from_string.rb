class RemoveContentFromString < ActiveRecord::Migration[5.0]
  def change
    remove_column :inquiries, :content, :string
  end
end
