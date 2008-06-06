class HoneyPotCaptchaFieldForComments < ActiveRecord::Migration
  def self.up
		change_table :comments do |t|
			t.string :comment_something
		end
  end

  def self.down
		change_table :comments do |t|
			t.remove :comment_something
		end
  end
end
