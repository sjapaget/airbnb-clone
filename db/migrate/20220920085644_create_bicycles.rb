class CreateBicycles < ActiveRecord::Migration[7.0]
  def change
    create_table :bicycles do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.string :size, null: false
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
