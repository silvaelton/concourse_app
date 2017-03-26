class Mean < ActiveRecord::Base

	belongs_to :subscribe 
	
  attr_accessor :password

  validates :content, :subscribe_id, :password, presence: true
  validates_uniqueness_of :subscribe_id, scope: :project_id 
  validate :subscribe_is_valid?, if: 'self.project_id == 1'
  validate :custom_subscribe_is_valid?, if: 'self.project_id == 3'


  private

  def subscribe_is_valid?
    if ::Subscribe.where(id: self.subscribe_id, password: self.password).present?
      participation = ::Participation.find_by(name: "Prancha A1 (PDF até 15mb)") rescue nil
      if !::SubscribeParticipation.where(participation_id: participation.id, subscribe_id: self.subscribe_id).present?
        errors.add(:subscribe_id, "Nº de inscrição não realizou envio de participação para este concurso")
      end
    else
      errors.add(:subscribe_id, "Nº de inscrição ou senha inválidos")
    end
  end

  def custom_subscribe_is_valid?
    if ::Subscribe.where(id: self.subscribe_id, password: self.password).present?
      participation = ::SubscribeCustomParticipation.find_by(subscribe_id: self.subscribe_id) rescue nil
      if participation.nil?
        errors.add(:subscribe_id, "Nº de inscrição não realizou envio de participação para este concurso")
      end
    else
      errors.add(:subscribe_id, "Nº de inscrição ou senha inválidos")
    end
  end
end