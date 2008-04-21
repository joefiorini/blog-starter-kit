class AddEmailToUser < ActiveRecord::Migration
  def self.up
		add_column 'Users', 'email', :string
  end

  def self.down
		remove_column 'Users', 'email'
  end
end
