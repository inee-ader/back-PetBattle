class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :alias
      t.string :bio
      t.integer :gold, default: 50
      t.string :gif_url

      t.timestamps
    end
  end
end
