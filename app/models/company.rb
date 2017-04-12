class Company < ApplicationRecord
  before_save :set_default_values
  #Relations
  belongs_to :category
  belongs_to :company_type
  has_many :branches
  has_many :products
  has_many :services
  has_many :promotions
  has_many :phones, as: :imageable
  has_many :user_types
  has_many :users, through: :user_types
  #Validations
  #validates_associated :phones
  validates :company_name, :company_description, presence: true
  validates :company_name, length: {in: 6..20}
  #validates :company_description, length: {in: 20..100}

  def set_default_values
    self.company_active ||= true
  end
end
