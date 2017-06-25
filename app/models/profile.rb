class Profile < ApplicationRecord
  validate :location_can_be_located?
  belongs_to :user
  
  private
    
    def location_fields_entered? 
      if self.city == nil || self.state == nil || self.country == nil
        return false
      elsif self.city.length == 0 || self.state.length == 0  || self.country.length == 0 
        return false
      else
        return true
      end
    end
    
    # Validation function to theck if a real location was entered
    def location_can_be_located?
      
      # Only activate the record if the users location can be found
      self.active = false
      self.latitude = nil
      self.longitude = nil

      if location_fields_entered?
        coordinates = Geocoder.coordinates("#{self.city}, #{self.state}, #{self.country}")
        
        if coordinates == nil
          errors.add(:base, "Unable to locate '#{self.city}, #{self.state}, #{self.country}'")
        else
          # Set the latitude and longitude and activate the profile
          self.latitude = coordinates[0]
          self.longitude = coordinates[1]
          self.active = true
        end
        
      end
    end
    
end
