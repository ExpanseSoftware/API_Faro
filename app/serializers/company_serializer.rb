class CompanySerializer < ActiveModel::Serializer
  attributes :id, :company_name, :company_description
end
