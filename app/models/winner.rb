class Winner < ActiveRecord::Base
  belongs_to :subscribe_participation
  belongs_to :project

  enum winner_type: ['primeiro_lugar', 'segundo_lugar', 'terceiro_lugar', 'menção_honrosa']

  validates :subscribe_participation_id, :winner_type, presence: true
  validate  :subscribe_validate
  


  def subscribe_validate
    participation = ::Participation.find_by(name: "Prancha A1 (PDF até 15mb)") rescue nil
    subscribe = ::SubscribeParticipation.where(participation_id: participation.id, id: self.subscribe_participation_id)
    
    if !subscribe.present? || ::Winner.where(subscribe_participation_id: self.subscribe_participation_id).present?
      @subscribe_participation_id = self.subscribe_participation_id
      errors.add(:subscribe_participation_id, "Projeto não encontrado.")
    else
      @subscribe_participation_id = self.subscribe_participation_id
    end
  end

  def self.winner_type_allow project
    array = {}

    ::Winner.winner_types.each do |k,v|
      unless project.winners.where(winner_type: v).present? && %w(primeiro_lugar segundo_lugar terceiro_lugar).include?(k)
        array["#{k}".to_sym] = v
      end
    end
 
    array
  end

end
