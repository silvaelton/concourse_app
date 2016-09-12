module Admin
  class Session
    include ActiveModel::Model

    attr_accessor :id, :email, :password

    validates :email, email: true, presence: true
    validates :password, presence: true
    validate  :verify_credentials

    private

    def verify_credentials
      user = ::User.where(email: self.email, password: self.password, status: true)

      if user.present?
        self.id = user.last.id
      else
        errors.add(:email, "e-mail ou senha não conferem")
      end
    end
  end
end