class EventsFixed < ActiveRecord::Migration

  def change

    create_table :events do |t|

      t.string     :event_name
      t.references :user, foreign_key: true
      t.boolean    :completed
      t.timestamp  :start_time
      t.timestamp  :end_time

      t.timestamps null: false
    end

  end

end
