class SubscribeParticipation < ActiveRecord::Base

  belongs_to :participation
  
  validates :participation_path, presence: true 

  mount_uploader :participation_path, ::DocumentUploader
end
