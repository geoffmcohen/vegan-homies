class AddCityStateCountryToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :city, :string
    add_column :profiles, :state, :string
    add_column :profiles, :country, :string
  end
end
