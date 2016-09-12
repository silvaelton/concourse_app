class Nav < ActiveRecord::Base
  belongs_to :page

  scope :actives, -> { where(publish: true)}
  
  validates :label, :order, presence: true
  validates :href, presence: true, unless: 'self.is_page'
  validates :page, presence: true, if: 'self.is_page'
end
