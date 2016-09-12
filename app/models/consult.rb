class Consult < ActiveRecord::Base
  validates :content, presence: true

  enum situation: ['não_lida', 'lida', 'respondida']
end
