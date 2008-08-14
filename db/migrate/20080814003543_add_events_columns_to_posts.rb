class AddEventsColumnsToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :location_id
    end
  end

  def self.down
    change_table :posts do |t|
      t.drop_column :start_time
      t.drop_column :end_time
      t.drop_column:location_id
    end
    
  end
end
