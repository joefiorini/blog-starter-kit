class CreateCommentableSchema < ActiveRecord::Migration
  def self.up
    create_table "comments", :force => true do |t|
      t.string :name
      t.string :email
      t.string :url
      t.text "comment", :default => ""
      t.datetime "created_at", :null => false
      t.integer "commentable_id", :default => 0, :null => false
      t.string "commentable_type", :limit => 15, :default => "", :null => false
    end
  end

  def self.down
    drop_table :comments
  end
end
