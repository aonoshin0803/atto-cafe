class AddContentToInquiries < ActiveRecord::Migration[5.0]
  def change
    add_column :inquiries, :content, :text
  end
end
