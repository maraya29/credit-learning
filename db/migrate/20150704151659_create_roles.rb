class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name, :null => false
      t.string  :description,       :default => '', :null => false
      t.integer :requires_approval, :default => 0,  :null => false
      t.boolean :super_user,        :default => false,  :null => false
      t.string  :landing_page,      :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
