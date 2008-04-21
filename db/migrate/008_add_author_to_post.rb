class AddAuthorToPost < ActiveRecord::Migration
  def self.up
		add_column 'Posts', :author_id, :integer
  end

  def self.down
		remove_column 'Posts', :author_id
  end
end
