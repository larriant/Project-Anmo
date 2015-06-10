class AddEventCreatedByUser < ActiveRecord::Migration
  def change

    add_column :events, :one_off, :boolean, default: false

  end
end
