class Mean < ActiveRecord::Base

	belongs_to :subscribe 
	
  attr_accessor :password

  validates :content, presence: true
  validates_uniqueness_of :subscribe_id, scope: :project_id 
  validate :subscribe_is_valid?


  private

  def subscribe_is_valid?
    if ::Subscribe.where(id: self.subscribe_id, password: self.password).present?
      participation = ::Participation.find_by(name: "Prancha A1 (PDF até 15mb)") rescue nil
      if !::SubscribseParticipation.where(participation_id: participation.id, subscribe_id: self.subscribe_id).present?
        errors.add(:subscribe_id, "Nº de inscrição não realizou envio de participação para este concurso")
      end
    else
      errors.add(:subscribe_id, "Nº de inscrição ou senha inválidos")
    end
  end
end