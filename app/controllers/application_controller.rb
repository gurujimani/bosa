class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  protect_from_forgery
  layout 'application'
  
  @title = "Bosa"
  
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

end
