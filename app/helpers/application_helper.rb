module ApplicationHelper
  def date_format(date)
    return 'N/A' unless date.present?
    date.strftime("%m/%d/%Y %I:%M %p")
  end
  
  def can_access?(feature_name)
    current_user.try(:can_access?, feature_name.to_sym)
  end
end
