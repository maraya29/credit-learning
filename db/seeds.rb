# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#features
role_feature_name = 'Administration'
role_feature = RoleFeature.where(:name => role_feature_name).first || RoleFeature.new(:name => role_feature_name)
puts role_feature.save ? "Role feature loaded: #{role_feature_name}" : "Role load failed: #{role_feature_name}"

#roles
role_name = "Administrator"
role = Role.find_by_name(role_name) || Role.new
role.attributes = {
  :name        => role_name,
  :description => role_name,
  :super_user  => true
}
puts role.save ? "Role loaded: #{role_name}" : "Role load failed: #{role_name}"
role.add_feature('Administration')


email='maraya@growthaccelerationpartners.com'
user = User.where(:email => email).first || User.new
user.attributes = {
  :first_name            => 'Admin',
  :last_name             => 'User',
  :email                 => email,
  :password              => 'bar-b-queue',
  :password_confirmation => 'bar-b-queue',
  :default_theme         => 'superhero',
  :role_id               => Role.find_by_name('Administrator').id
}
user.save(validate: false)