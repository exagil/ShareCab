class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def after_sign_in_path_for(resource_or_scope)

    if request.env['omniauth.origin']
      if request.env['omniauth.origin']=='http://localhost:3000/'
          request.env['omniauth.origin']='http://localhost:3000/static_pages/dashboard'
      end
      request.env['omniauth.origin']
    end
  end
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :dob << :name << :gender
    # The following DID NOT WORK
    # devise_parameter_sanitizer.for(:sign_up) += [:dob,:name,:gender]
  end
end
