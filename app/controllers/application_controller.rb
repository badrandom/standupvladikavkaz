class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_auth, except: %i[new edit destroy create show index]
  before_action :set_locale

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_auth
    current_user
    redirect_to login_path unless @current_user
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale }.merge options
  end

end
