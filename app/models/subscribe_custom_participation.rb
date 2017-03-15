class SubscribeCustomParticipation < ActiveRecord::Base
  has_many :subscribe_custom_teams
  accepts_nested_attributes_for :subscribe_custom_teams, allow_destroy: true

  validates :archive_file_one, :archive_file_two, presence: true 

  validates :archive_file_one, file_size: { less_than_or_equal_to: 20.megabytes },
            file_content_type: { allow: ['application/pdf'],
                                message: "Arquivo excede 20 MB ou está em formato inválido. Formatos válidos [PDF]"}
  
  
  validates :archive_file_two, file_size: { less_than_or_equal_to: 3.megabytes },
          file_content_type: { allow: ['image/jpeg', 'image/png'],
                                        message: "Arquivo excede 3 MB ou está em formato inválido. Formatos válidos [JPEG, PNG]"}
 
  mount_uploader :archive_file_one, ::DocumentUploader
  mount_uploader :archive_file_two, ::DocumentUploader
  
end
