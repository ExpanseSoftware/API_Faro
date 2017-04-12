class CreatePromoRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :promo_relations do |t|
      t.references :promotion, foreign_key: true
      t.references :branch, foreign_key: true
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
