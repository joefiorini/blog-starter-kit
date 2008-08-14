class AddLocationUrl < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.string :url
    end
  end

  def self.down
    change_table :locations do |t|
      t.drop_column :url
    end
  end
end
