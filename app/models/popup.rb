class Popup < ActiveRecord::Base

  belongs_to :project

  validates :title, :link, :content, presence: true
end
