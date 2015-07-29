class Role < ActiveRecord::Base

  has_many :role_feature_permissions
  has_many :role_features, :through => :role_feature_permissions

  def has_feature?(feature_name)
    role_features.where(:name => feature_name.to_s.titleize).any?
  end

  def add_feature(feature_name)
    feature = RoleFeature.find_by_name(feature_name)
    return if feature.blank?
    RoleFeaturePermission.find_or_create_by(:role => self, :role_feature => feature)
  end

end
