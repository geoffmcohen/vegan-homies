class AddLocationToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :location, :string
  end
end
