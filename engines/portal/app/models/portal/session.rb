module Portal
  class Session
    include ActiveModel::Model 

    attr_accessor :id, :subscribe_id, :password, :project_id

    validates :subscribe_id, presence: true
    validates :password, presence: true
    validate  :verify_credentials

    private

    def verify_credentials
      user = ::Subscribe.where(id: self.subscribe_id, project_id: self.project_id, password: self.password)

      if user.present?
        self.id = user.last.id
      else
        errors.add(:subscribe_id, "Nº de inscrição ou senha não conferem")
      end
    end
  end
end