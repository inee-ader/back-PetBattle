class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.string :abilities
      t.string :img_url
      t.integer :hp
      t.integer :level, default: 1
      t.integer :exp, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
