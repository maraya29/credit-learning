class CreateRoleFeatures < ActiveRecord::Migration
  def self.up
    create_table :role_features do |t|
      t.string :name, :null => false
      t.timestamps
    end

    add_index :role_features, :name
  end

  def self.down
    drop_table :role_features
  end
end
