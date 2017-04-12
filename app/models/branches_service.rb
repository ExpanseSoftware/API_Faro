class BranchesService < ApplicationRecord
  #relations
  belongs_to :branch
  belongs_to :service
end
