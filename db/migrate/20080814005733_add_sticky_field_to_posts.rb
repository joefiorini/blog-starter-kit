class AddStickyFieldToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.boolean :sticky
    end
  end

  def self.down
    change_table :posts do |t|
      t.drop_column :sticky
    end
  end
end
