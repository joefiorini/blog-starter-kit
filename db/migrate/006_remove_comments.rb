class RemoveComments < ActiveRecord::Migration
  def self.up
    drop_table :comments
  end

  def self.down
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :url
      t.string :body

      t.timestamps
    end
  end
end
