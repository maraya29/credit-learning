class RoleFeaturePermission < ActiveRecord::Base
  belongs_to :role_feature
  belongs_to :role
end
