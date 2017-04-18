class CategorySerializer < ActiveModel::Serializer
  attributes :id, :category_name, :category_description, :category_active
end
