class ApplicationController < ActionController::Base
	protected
 
  	def devise_parameter_sanitizer
    	if resource_class == User
      		User::ParameterSanitizer.new(User, :user, params)
    	else
      		super # Use the default one
    	end
    	if resource_class == Creator
      		Creator::ParameterSanitizer.new(Creator, :creator, params)
    	else
      		super # Use the default one
    	end
  	end


end
