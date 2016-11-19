class Mean < ActiveRecord::Base

  attr_accessor :password

  validates :content, presence: true

  validate :subscribe_is_valid?


  private

  def subscribe_is_valid?
    if !::Subscribe.where(id: self.subscribe_id, password: self.password).present?
      errors.add(:subscribe_id, "Nº de inscrição ou senha inválidos")
    end
  end
end