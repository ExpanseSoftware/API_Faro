class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.references :company, foreign_key: true
      t.string :promotion_name
      t.text :promotion_description
      t.boolean :promotion_active

      t.timestamps
    end
  end
end
