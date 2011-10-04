class ApplicationController < ActionController::Base
  protect_from_forgery

  check_authorization :unless => :devise_controller?

  rescue_from ActionController::InvalidAuthenticityToken do |e|
    flash[:notice] = 'There was an error. Please sign in again.'
    redirect_to root_url
  end
end

