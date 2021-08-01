class AddImageToCaves < ActiveRecord::Migration[6.0]
  def change
    add_column :caves, :image, :string
  end
end
