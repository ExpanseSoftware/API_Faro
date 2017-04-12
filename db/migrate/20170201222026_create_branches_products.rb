class CreateBranchesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :branches_products do |t|
      t.references :branch, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
