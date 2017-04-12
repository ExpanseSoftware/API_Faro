class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.references :company, foreign_key: true
      t.string :service_name
      t.text :service_description
      t.boolean :service_active

      t.timestamps
    end
  end
end
