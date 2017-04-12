class Category < ApplicationRecord
  before_save :set_default_values
  #Relations
  has_many :companies
  #Validations
  #validates :category_name, length: {in: 6..20}
  validates :category_description, length: {in: 20..100}
  validates :category_name, uniqueness: true
  validates :category_name, :category_description, presence: true

  def set_default_values
    self.category_active ||= true
  end
end
