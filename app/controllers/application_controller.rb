class ApplicationController < ActionController::Base
  #Before every method can be called a log in is necessary (can be deactivated with: skip_before_action :authenticate_user!, only:NAME_OF_METHOD )
  before_action :authenticate_user!

  def configure_permitted_parameters
    # First and Last name field for Log-in
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
