class SessionsController < ApplicationController
	skip_before_action :authorize
	
  def new
  end

  def create
    
    # Get lowercase of the username or email entered
    username = params[:name].downcase;
    
    # Try to get the user by name or email if that doesn't work
  	if !user = User.find_by(name: username)
  	  user = User.find_by(email: username)
  	end
  	
    # Try to authenticate the username with the password provided
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
