class CreateRoleFeaturePermissions < ActiveRecord::Migration
  def self.up
    create_table :role_feature_permissions do |t|
      t.references :role
      t.references :role_feature
      t.timestamps
    end

    add_index :role_feature_permissions, :role_id
    add_index :role_feature_permissions, :role_feature_id
    add_index :role_feature_permissions, [:role_id, :role_feature_id]
  end

  def self.down
    drop_table :role_feature_permissions
  end
end
