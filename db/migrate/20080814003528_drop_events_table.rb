class DropEventsTable < ActiveRecord::Migration
  def self.up
    drop_table :events
  end

  def self.down
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :location_id
    end
  end
end
