class Promotion < ApplicationRecord
  before_save :set_default_values
  #Relations
  belongs_to :company
  has_many :promo_relations
  has_and_belongs_to_many :branches
  #Validations
  validates :promotion_name, :promotion_description, presence: true
  validates :promotion_name, length: {in: 6..50}
  validates :promotion_description, length: {in: 20..150}

  def set_default_values
    if self.promotion_active == nil
      self.promotion_active ||= true
    end
  end
end
