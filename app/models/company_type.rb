class CompanyType < ApplicationRecord
  #Relations
  has_many :companies
  #Validations
  #validates :company_type_name, presence: true
  #validates :company_type_name, uniqueness: true
  #validates :company_type_name, length: {in: 6..20}
end
