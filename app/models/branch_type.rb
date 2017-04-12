class BranchType < ApplicationRecord
  #Relations
  has_many :branches
  #Validations
  #validates :branch_type_name, uniqueness: true
  #validates :branch_type_name, presence: true
  #validates :branch_type_name, length: {in: 6..20}
end
