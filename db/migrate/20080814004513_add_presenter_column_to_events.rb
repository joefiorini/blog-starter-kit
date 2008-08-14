class AddPresenterColumnToEvents < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.string :presenter
    end
  end

  def self.down
    change_table :posts do |t|
      t.drop_column :presenter
    end    
  end
end
