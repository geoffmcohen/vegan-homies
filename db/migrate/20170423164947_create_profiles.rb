class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :display_name
      t.string :about
      t.string :looking_to_meet
      t.boolean :active
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
