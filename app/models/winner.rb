class Winner < ActiveRecord::Base
  belongs_to :subscribe_participation
  belongs_to :subscribe_custom_participation, foreign_key: :subscribe_participation_id
  belongs_to :project


  enum winner_type: ['primeiro_lugar', 'segundo_lugar', 'terceiro_lugar', 'quarto_lugar','quinto_lugar', 'menção_honrosa', 'finalista']
  
  validates_uniqueness_of :subscribe_participation_id, scope: :project_id

  validates :subscribe_participation_id, :winner_type, presence: true
  validate  :subscribe_validate, if:'self.project_id == 1'
  validate  :subscribe_custom_validate, if:'self.project_id == 3'
  
  def subscribe_custom_validate
    subscribe = ::SubscribeCustomParticipation.where(id: self.subscribe_participation_id)

    if !subscribe.present? 
      errors.add(:subscribe_participation_id, "Projeto não encontrado.")
    end
  end


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
    
    if project.id == 1
      array = {}

      ::Winner.winner_types.each do |k,v|
        unless project.winners.where(winner_type: v).present? && %w(primeiro_lugar segundo_lugar terceiro_lugar).include?(k)
          array["#{k}".to_sym] = v
        end
      end
   
      array
    else
      %w(menção_honrosa finalista)
    end
  end

end
