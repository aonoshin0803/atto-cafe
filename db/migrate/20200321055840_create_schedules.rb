class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer:shop_id
      t.integer:user_id
      t.date:join_date
      t.time:start_time
      t.time:end_time
      t.text:content
      t.timestamps
    end
  end
end
