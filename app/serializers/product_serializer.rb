class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :product_description, :product_price,
    :product_active_status, :product_sold_quantity
end
