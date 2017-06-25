class RemoveLocationFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :location, :string
  end
end
