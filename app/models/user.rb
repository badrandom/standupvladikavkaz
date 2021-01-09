class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  before_save :default_values
  def default_values
    self.is_admin ||= false
  end
end
