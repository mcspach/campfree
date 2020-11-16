class CreateTents < ActiveRecord::Migration[6.0]
  def change
    create_table :tents do |t|
      t.string :title
      t.string :location
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
