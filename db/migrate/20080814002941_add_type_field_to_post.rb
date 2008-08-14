class AddTypeFieldToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.string :type
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove_column :type
    end
  end
end
