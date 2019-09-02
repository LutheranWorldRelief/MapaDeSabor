class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :set_locale
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    return panel_root_url if resource_or_scope == :panel
    super
  end
  
	def set_locale
	  I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
	end

end
