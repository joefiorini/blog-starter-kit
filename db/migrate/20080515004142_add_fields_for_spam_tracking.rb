class AddFieldsForSpamTracking < ActiveRecord::Migration
  def self.up
		change_table :comments do |t|
			t.boolean :is_spam, :default => 0
			t.string :spam_type, :default => 'none'
		end
  end

  def self.down
		change_table :comments do |t|
			t.remove :is_spam
			t.remove :spam_type
		end
  end
end
