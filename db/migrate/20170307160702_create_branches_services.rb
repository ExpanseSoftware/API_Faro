class CreateBranchesServices < ActiveRecord::Migration[5.0]
  def change
    create_table :branches_services do |t|
      t.references :branch, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
