class CreateActivityLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_logs do |t|
      t.integer :baby_id
      t.integer :assistant_id
      t.integer :activity_id
      t.time :start_time
      t.time :stop_time
      t.time :duration
      t.string :name
      t.text :comments

      t.timestamps
    end
  end
end
