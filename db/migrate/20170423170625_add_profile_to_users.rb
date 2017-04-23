class AddProfileToUsers < ActiveRecord::Migration[5.0]
  def change
  	print "This gets printed\n"
    add_reference :users, :profile, foreign_key: true    
  end
  
  def up  	
  	print "Tring to add profiles to users\n" 
  	
  	# Add the profile to each user
    Profile.all.each do |profile|
    	if profile.user_id != nil
    		user = User.where(id: profile.user_id)
    		user.profile_id = profile.id
    		user.save!
    	end
    end
  end
end
