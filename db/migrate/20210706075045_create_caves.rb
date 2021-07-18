class CreateCaves < ActiveRecord::Migration[6.0]
  def change
    create_table :caves do |t|
      t.string :name,            null: false
      t.string :address,         null: false
      t.string :URL
      t.text :recommend,         null: false
      t.integer :purpose_id,         null: false
      t.integer :prefecture_id,  null: false
      t.string :password, null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
