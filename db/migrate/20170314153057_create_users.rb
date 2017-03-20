class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string     :user_name
      t.string     :user_lastname
      t.string     :user_second_lastname
      t.string     :user_email
      t.date       :user_birthdate
      t.string     :user_gender
      t.string     :password_digest
      t.string     :token
      t.boolean     :user_active
      t.string     :active_account_token
    end
    add_index :users, :token, unique: true
  end
end
