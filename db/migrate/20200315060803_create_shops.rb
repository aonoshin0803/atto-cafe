class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      
      t.string:name
      t.string:image
      t.string:place
      t.time:start_time
      t.time:end_time
      t.string:wifi
      t.text:wifi_text
      t.string:outlet
      t.text:outlet_text
      t.integer:gender_man
      t.integer:gender_woman
      t.integer:wide
      t.integer:staff
      t.text:staff_text
      t.integer:place
      t.integer:beans
      t.integer:food
      t.text:food_text
      t.integer:quietness
      t.text:quietness_text
      t.integer:congestion
      t.text:congestion_text
      t.string:page
      t.text:other
      t.integer:user_id
      t.timestamps
    end
  end
end
