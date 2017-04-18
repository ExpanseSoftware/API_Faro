class Branch < ApplicationRecord
  before_save :set_default_values
  #Relations
  belongs_to :company
  belongs_to :branch_type
  has_many :promo_relations
  has_many :phones, as: :imageable
  has_and_belongs_to_many :services
  has_and_belongs_to_many :promotions
  has_and_belongs_to_many :products
  #Validations
  #validates :branch_coordinates, :branch_address, length: {in: 10..50}
  validates :branch_coordinates, :branch_address, presence: true

  def set_default_values
    if self.branch_active == nil && self.branch_promotion_status == nil
      self.branch_active ||= true
      self.branch_promotion_status ||= false
    end
  end

end
