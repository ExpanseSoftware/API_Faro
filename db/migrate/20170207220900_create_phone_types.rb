class CreatePhoneTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_types do |t|
      t.string :phone_type_name

      t.timestamps
    end
  end
end
