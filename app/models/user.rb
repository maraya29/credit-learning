class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.login_field = :email
    config.merge_validates_length_of_password_field_options({:minimum => 6, :maximum => 20})
  end
  
  belongs_to :role 
  validates_presence_of :first_name, :last_name, :email, :role
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def can_access?(feature_name)
    role.super_user? || role.has_feature?(feature_name)
  end
  
  def downcase_email_domain
    email_domain.try(:downcase)
  end
  
  def email_domain
    EmailValidator.new(email).domain_part
  end
end
