class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # include Olala::CustomAuth

  def admin_namespace?
    request.subdomain.match(/\Aadmin\Z/) != nil
  end
  def main_domain_root_url
    root_url host: Rails.configuration.action_mailer.default_url_options[:host]
  end
  helper_method :admin_namespace?, :main_domain_root_url

  def after_sign_out_path_for resource_name_or_scope
    main_domain_root_url
  end
end
