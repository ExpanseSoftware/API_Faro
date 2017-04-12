class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.references :company, foreign_key: true
      t.references :branch_type, foreign_key: true
      t.boolean :branch_active
      t.boolean :branch_promotion_status
      t.string :branch_address
      t.string :branch_coordinates

      t.timestamps
    end
  end
end
