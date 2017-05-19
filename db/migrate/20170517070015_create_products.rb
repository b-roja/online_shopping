class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :price
      t.string :size

      t.timestamps
    end
  end
end
