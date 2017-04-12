class BranchSerializer < ActiveModel::Serializer
  attributes :id, :branch_address, :branch_coordinates, :branch_promotion_status
  #belongs_to :branch_type

end
