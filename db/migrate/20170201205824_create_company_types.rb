class CreateCompanyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :company_types do |t|
      t.string :company_type_name

      t.timestamps
    end
  end
end
