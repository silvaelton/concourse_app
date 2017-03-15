class SubscribeParticipation < ActiveRecord::Base

  belongs_to :subscribe
  belongs_to :participation
  
  validates :participation_path, presence: true 


  validates :participation_path, file_size: { less_than_or_equal_to: 15.megabytes },
            file_content_type: { allow: ['application/pdf'],
                                message: "Arquivo excede 15 MB ou está em formato inválido. Formatos válidos [PDF]"}
  
  
  validates :participation_path, file_size: { less_than_or_equal_to: 3.megabytes },
          file_content_type: { allow: ['image/jpeg', 'image/png', 'application/pdf', 'application/msword',
                                       'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
                                        message: "Arquivo excede 3 MB ou está em formato inválido. Formatos válidos [JPEG, PNG, PDF, DOC, DOCX]"}
  def participation_path_url
    "http://wmasites.com.br/iabconcursos/documents/#{self.participation_path}"
  end

  private 

  def project_participation?
    participation = ::Participation.find_by(name: "Prancha A1 (PDF até 15mb)") rescue nil
    self.participation_id == participation.id 
  end
end
