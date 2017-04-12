class PromoRelation < ApplicationRecord
  #Relations
  belongs_to :imageable, polymorphic: true
  belongs_to :promotion
  belongs_to :branch
end
