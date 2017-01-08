class Subscribe < ActiveRecord::Base

  belongs_to :project 
  belongs_to :state

  has_many :subscribe_participations
  has_many :subscribe_teams
  has_many :subscribe_optionals, class_name: "::SubscribeTeamOptional"
  has_many :subscribe_requireds, class_name: "::SubscribeTeamRequired"


  scope :processing, -> { where(situation: 0)}
  scope :recused,    -> { where(situation: 1)}
  scope :enabled,    -> { where(situation: 2)}

  attr_accessor :password_confirmation
  
  enum gender: ['masculino', 'feminino']
  enum situation: ['processando', 'indeferido', 'homologado']
  enum professional_type: ['arquiteto_urbanista','engenheiro_civil']

  validates :name, :cpf, :born, presence: true 
  validates :cep,  :state, :city, :address, presence: true 
  
  validates :fantasy_name, :social_reason, :cnpj, presence: true
  validates :social_contract, :state_number, :local_subscribe, presence: true

  validates :email, email: true 
  validates :telephone,presence: true
  validates :cpf, cpf: true 
  validates_uniqueness_of :cpf, scope: :project_id 
  validates :cnpj, cnpj: true

  validates :password, :password_confirmation, length: {minimum: 6, maximum: 24}, presence: true, if: 'self.password_changed?'
  validate  :compare_passwords, if: 'self.password_changed?'

  def self.count_projects
    @index = 0
  
    ::Subscribe.all.each do |subscribe|
      if subscribe.send_participation?
        @index += 1
      end
    end

    @index
  end

  def self.send_participation_ok
    @index = 0
  
    ::Subscribe.all.each do |subscribe|
      if subscribe.send_participation_ok?
        @index += 1
      end
    end

    @index
  end

  def self.allow_project?
    (Date.current >= Date.parse('07/11/2016')) && (Date.current <= Date.parse('09/11/2016'))
  end

  def send_project? 
    self.id == 2 || (self.paid && (Date.current >= Date.parse('07/11/2016') && Date.current <= Date.parse('09/11/2016')))
  end

  def send_juridical?
    participation = ::Participation.find_by(name: "Prancha A1 (PDF até 15mb)") rescue nil
    self.subscribe_participations.where.not(participation_id: participation.id).count == 11
  end

  def start_send_juridical?
    self.subscribe_participations.count > 0
  end

  def send_members?
    self.subscribe_requireds.count == 13
  end

  def start_send_members?
    self.subscribe_requireds.count > 0
  end

  def send_project_a3?
    participation = ::Participation.find_by(name: "Prancha A1 (PDF até 15mb)") rescue nil
    self.subscribe_participations.where(participation_id: participation.id).present?
  end

  def send_participation?
    send_juridical? && send_members? && send_project?
  end

  def send_participation_ok?
    send_juridical? && send_members? && send_project_a3?
  end

  private

  def compare_passwords
    if self.password != self.password_confirmation
      errors.add(:password, "As senhas não são iguais")
    end
  end
end
