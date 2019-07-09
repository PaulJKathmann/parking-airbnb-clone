class ApplicationController < ActionController::Base
  #Before every method can be called a log in is necessary (can be deactivated with: skip_before_action :authenticate_user!, only:NAME_OF_METHOD )
  before_action :authenticate_user!
end
