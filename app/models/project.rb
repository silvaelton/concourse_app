class Project < ActiveRecord::Base
  belongs_to :main_page, class_name: "Page"

  has_many :navs, -> { order('"order" ASC') } 

  scope :actives, -> { where(situation: 0)}
  scope :waiting, -> { where(situation: 1)}

  enum situation: ['publicado', 'previsto', 'desenvolvimento', 'cancelado']

  validates :title, :description, :start, :end, presence: true
  validates :consult_start, :consult_end, presence: true
  validates :subscribe_start, :subscribe_end, presence: true
  validates :participation_start, :participation_end, presence: true
  validates :slug, uniqueness: true, presence: true
end
