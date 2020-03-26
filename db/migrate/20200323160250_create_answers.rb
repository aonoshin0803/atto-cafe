class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string:email
      t.text:content
      t.integer:inquiry_id
      t.timestamps
    end
  end
end
