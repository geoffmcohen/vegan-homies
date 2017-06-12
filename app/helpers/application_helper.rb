module ApplicationHelper

  # Returns the logged in user or nil if none exists
  def get_user 
    User.find_by(id: session[:user_id])
  end
  
  # Returns the profile of the curent user or nil if none exists
  def get_profile
    if user = get_user
      profile = Profile.find_by(user_id: session[:user_id])
    else
      profile = nil
    end
    
    return profile    
  end

  # Gets the display name of the current user 
  def get_display_name 
    display_name = nil
    
    if profile = get_profile
      display_name = profile.display_name
    elsif user = get_user
      display_name = user.name
    end
    
    return display_name
  end
  
end
