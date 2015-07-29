class AddingUserRole < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :integer, :null => false
  end

  def self.down
    remove_column :users, :role_id
  end
end
