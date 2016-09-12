class Project < ActiveRecord::Base
  belongs_to :main_page, class_name: "Page"

  has_many :navs,     -> { order('"order" ASC') } 
  has_many :pages,    -> { order(:title) } 
  has_many :consults, -> { order('created_at DESC') } 

  scope :actives, -> { where(situation: 0)}
  scope :waiting, -> { where(situation: 1)}

  enum situation: ['publicado', 'previsto', 'desenvolvimento', 'cancelado']

  validates :title, :description, :start, :end, presence: true
  validates :consult_start, :consult_end, presence: true
  validates :subscribe_start, :subscribe_end, presence: true
  validates :participation_start, :participation_end, presence: true
  validates :slug, uniqueness: true, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged


  def allow_consult?
    self.consult_start <= Date.today && self.consult_end >= Date.today && self.consult_publish
  end

end
