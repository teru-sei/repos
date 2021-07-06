class CreateCaves < ActiveRecord::Migration[6.0]
  def change
    create_table :cafes do |t|
      t.string :name,        null: false
      t.string :address,     null: false
      t.string :URL
      t.text :recommend,     null: false
      t.references :user,    type: :bigint, foreign_key: true
      t.timestamps
    end
  end
end
