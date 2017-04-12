class Service < ApplicationRecord
  before_save :set_default_values
  #Relations
  belongs_to :company
  has_many :promo_relations, as: :imageable
  has_and_belongs_to_many :branches
  #Validations
  validates :service_name, :service_description, presence: true
  validates :service_name, length: {in: 6..20}
  validates :service_description, length: {in: 20..100}
  
  def set_default_values
    self.service_active ||= true
  end
end
