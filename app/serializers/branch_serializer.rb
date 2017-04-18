class BranchSerializer < ActiveModel::Serializer
  attributes :id, :branch_address, :branch_coordinates, :branch_promotion_status,
    :branch_active
  has_many :products
  has_many :services
  #belongs_to :branch_type

end
