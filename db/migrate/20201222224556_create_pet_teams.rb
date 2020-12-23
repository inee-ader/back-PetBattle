class CreatePetTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :pet_teams do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
