class Phone < ApplicationRecord
  #Relations
  belongs_to :imageable, polymorphic: true
  belongs_to :phone_type
  #Validations
  validates :phone_number, numericality: { only_integer: true }
end
