class PhoneType < ApplicationRecord
  #Relations
  has_many :phones
  #Validations
  #validates :phone_type_name, presence: true
  #validates :phone_type_name, length: {in: 6..20}
  #validates :phone_type_name, uniqueness: true
end
