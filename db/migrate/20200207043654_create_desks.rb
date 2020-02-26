class CreateDesks < ActiveRecord::Migration[5.2]
  def change
    create_table :desks do |t|
      t.references :office, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
