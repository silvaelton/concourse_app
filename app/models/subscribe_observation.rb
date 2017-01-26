
class SubscribeObservation < ActiveRecord::Base
  validates :content, presence: true
end
