class CreateBranchPromotionRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :branch_promotion_relations do |t|
      t.references :branch, foreign_key: true
      t.references :promotion, foreign_key: true

      t.timestamps
    end
  end
end
