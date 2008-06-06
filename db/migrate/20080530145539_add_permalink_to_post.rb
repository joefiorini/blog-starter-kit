class AddPermalinkToPost < ActiveRecord::Migration
  def self.up
		change_table :posts do |t|
			t.string :permalink, :length => 250
		end
  end

  def self.down
  end
end
