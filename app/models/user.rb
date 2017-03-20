class User < ApplicationRecord
  has_secure_token
  has_secure_password
  before_save :set_default_values

  validates :user_name, :user_lastname, :user_email, presence: true
  validates :user_email, uniqueness: true
  validates_format_of :user_email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


  # Set default values for user, but keep in mind that this is done after the validations
  def set_default_values
    self.user_active ||= false
    self.active_account_token ||= Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def full_name
    self.user_name + " " + self.user_lastname
  end

end
