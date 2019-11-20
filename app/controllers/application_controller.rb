class ApplicationController < ActionController::Base
  before_action :set_locale
  http_basic_authenticate_with name: ENV["http_auth_username"], password: ENV["http_auth_userpassword"] if Rails.env.production?

  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end
  
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
