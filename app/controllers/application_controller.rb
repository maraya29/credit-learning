class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user, :logout_app, :default_theme
  before_action :set_locale
  before_action :require_user
  
  def change_theme
    if params[:theme_name].present?
      current_user.default_theme = params[:theme_name]
      current_user.save
    end
    render :index
  end
  
  private
  
  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end
  
  def index; end
  
  def default_theme
    return current_user.default_theme if current_user.present?
    'default'
  end
  
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def logout_app
    logout_url
  end

  def current_user_session
    @current_user_session ||= UserSession.find; @current_user_session
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    logger.debug "ApplicationController::require_user"
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
    return false
    end
  end

  def require_no_user
    logger.debug "ApplicationController::require_no_user"
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      return false
    end
  end

  def store_location
    #session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
