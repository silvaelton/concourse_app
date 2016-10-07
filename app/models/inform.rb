class Inform < ActiveRecord::Base

  validates :title, :date, :description, presence: true
end
