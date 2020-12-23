class CreateBosses < ActiveRecord::Migration[6.0]
  def change
    create_table :bosses do |t|
      t.string :name
      t.integer :hp
      t.integer :base_damage
      t.string :img_url
      t.string :abilities
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
