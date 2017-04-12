class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.text :category_description
      t.boolean :category_active

      t.timestamps
    end
  end
end
