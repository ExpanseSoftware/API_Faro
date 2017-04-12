class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :company, foreign_key: true
      t.string :product_name
      t.text :product_description
      t.float :product_price
      t.boolean :product_active
      t.integer :product_sold_quantity

      t.timestamps
    end
  end
end
