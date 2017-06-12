class SessionsController < ApplicationController
	skip_before_action :authorize
	
  def new
  end

  def create
    # Try to get the user by name
  	user = User.find_by(name: params[:name].downcase!)
  	
  	# Otherwise try to get the user by email
  	if !user 
  	  user = User.find_by(email: params[:name].downcase!)
  	end
  	
  	if user.try(:authenticate, params[:password])
  		session[:user_id] = user.id
  		redirect_to welcome_index_url
  	else
  		redirect_to login_url, alert: "Invalid user/password"
  	end
  end

  def destroy
		session[:user_id] = nil
  	redirect_to welcome_index_url, notice: "Logged out"
  end
end
