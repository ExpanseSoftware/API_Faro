class Product < ApplicationRecord
  before_save :set_default_values
  #Relations
  belongs_to :company
  has_many :promo_relations, as: :imageable
  has_and_belongs_to_many :branches
  #Validations
  validates :product_name, :product_description, :product_price, presence: true
  #validates :product_name, length: {in: 6..20}
  validates :product_description, length: {in: 20..100}

  def set_default_values
    if self.product_active == nil
      self.product_active ||= true
    end
  end
end
