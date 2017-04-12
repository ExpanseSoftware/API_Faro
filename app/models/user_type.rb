class UserType < ApplicationRecord
  #Relations
  belongs_to :user
  belongs_to :company
end
