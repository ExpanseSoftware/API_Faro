class CreateBranchTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :branch_types do |t|
      t.string :branch_type_name

      t.timestamps
    end
  end
end
