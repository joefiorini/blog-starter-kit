class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :openid_url
      t.timestamps
    end
  end

  def self.down
    remove_column :name
    remove_column :openid_url
    drop_table :users
  end
end
