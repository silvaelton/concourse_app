class Project < ActiveRecord::Base
  belongs_to :main_page, class_name: "Page"

  has_many :navs,       -> { order('"order" ASC') } 
  has_many :pages,      -> { order(:title) } 
  has_many :consults,   -> { order('created_at DESC') } 
  has_many :subscribes, -> { order('id DESC') } 
  has_many :informs,    -> { order('id DESC') } 
  has_many :popups,     -> { order('id DESC') } 
  has_many :means,      -> { order('id DESC') }
  # gato

  has_many :subscribe_teams#, class_name: "::SubscribeTeamOptional"
  has_many :subscribe_optionals, class_name: "::SubscribeTeamOptional"
  has_many :subscribe_requireds, class_name: "::SubscribeTeamRequired"

  has_many :winners

  # fim do gato


  scope :actives, -> { where(situation: 0)}
  scope :waiting, -> { where(situation: 1)}

  enum situation: ['publicado', 'previsto', 'desenvolvimento', 'cancelado']

  validates :title, :description, :start, :end, presence: true
  validates :consult_start, :consult_end, presence: true
  validates :subscribe_start, :subscribe_end, presence: true
  validates :participation_start, :participation_end, presence: true
  validates :slug, uniqueness: true, presence: true
 
  mount_uploader :result_document, ::DocumentUploader
  
  def custom_result_document_url 
    "http://wmasites.com.br/iabconcursos/documents/#{self.result_document}"
  end


  extend FriendlyId
  friendly_id :title, use: :slugged

  def participation_juridical; ::Participation.where(participation_type: 1).order(:id); end
  def participation_normal;    ::Participation.where(participation_type: 0).order(:id); end

  def allow_consult?
    self.consult_start <= Date.current && self.consult_end >= Date.current && self.consult_publish
  end


  def allow_subscribe?
    self.subscribe_start <= Date.current && self.subscribe_end >= Date.current && self.subscribe_publish
  end

end
