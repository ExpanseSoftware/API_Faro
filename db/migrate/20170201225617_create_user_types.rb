class CreateUserTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_types do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :user_status

      t.timestamps
    end
  end
end
