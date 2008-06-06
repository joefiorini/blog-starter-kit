class AddAuthorToPost < ActiveRecord::Migration
  def self.up
		change_table :posts do |t|
			t.integer :author_id
		end
  end

  def self.down
		change_table :posts do |t|
			 t.remove :author_id
		end
  end
end
