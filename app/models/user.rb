class User < ActiveRecord::Base
  attr_accessor :password_confirmation

  validates :name, presence:  true
  validates :email, email: true, uniqueness: true, presence: true
  validates :password, length: {minimum: 6, maximum: 12}, presence: true
  validates :password_confirmation, length: {minimum: 6, maximum: 12}, presence: true, if: 'self.password_changed?'
  validate  :compare_passwords

  enum privilege: ['visualizador', 'homologador', 'administrador']

  private

  def compare_passwords
    if self.password != self.password_confirmation && self.password_changed? 
      errors.add(:password, "Senhas não são iguais")
    end
  end
end
