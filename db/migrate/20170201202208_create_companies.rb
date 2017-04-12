class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.references :category, foreign_key: true
      t.references :company_type, foreign_key: true
      t.string :company_name
      t.text :company_description
      t.boolean :company_active

      t.timestamps
    end
  end
end
