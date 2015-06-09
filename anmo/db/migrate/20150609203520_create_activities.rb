class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_name
      t.references :user, foreign_key: true
      t.integer :importance
      t.string :activity_type
      t.integer :frequency
      t.timestamp :start_time
      t.timestamp :end_time
      t.timestamp :completion_date
      t.timestamps null: false
    end
  end
end
