class PromotionSerializer < ActiveModel::Serializer
  attributes :id, :promotion_name, :promotion_description, :promotion_active
end
