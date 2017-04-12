class BranchesProduct < ApplicationRecord
  #Relations
  belongs_to :branch
  belongs_to :product
end
