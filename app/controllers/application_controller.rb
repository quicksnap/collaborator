class ApplicationController < ActionController::Base
  
	protect_from_forgery

	before_filter :authenticate_user!

	check_authorization :unless => :devise_controller?

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to projects_url, :alert => "Access denied."
	end

end


