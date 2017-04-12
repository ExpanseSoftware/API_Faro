class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.references :phone_type, foreign_key: true
      t.references :imageable, polymorphic: true, index: true
      t.string :phone_number

      t.timestamps
    end
  end
end
