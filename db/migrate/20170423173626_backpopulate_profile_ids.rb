class BackpopulateProfileIds < ActiveRecord::Migration[5.0]
	def up  			 	
		# Add the profile to each user
		Profile.all.each do |profile|			
			if profile.user_id != nil				
				user = User.where(id: profile.user_id).first				
				user.profile_id = profile.id				
			  user.save!
			end
		end
	end
end


