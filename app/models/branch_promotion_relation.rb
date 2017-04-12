class BranchPromotionRelation < ApplicationRecord
  #relations
  belongs_to :branch
  belongs_to :promotion
end
