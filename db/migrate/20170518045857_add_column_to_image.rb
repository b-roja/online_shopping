class AddColumnToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :product_id, :string
    add_column :images, :user_id, :string
  end
end
