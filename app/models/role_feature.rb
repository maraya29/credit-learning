class RoleFeature < ActiveRecord::Base
  has_many :role_feature_permissions
  has_many :roles, :through => :role_feature_permissions
end
