class SubscribeCustomTeam < ActiveRecord::Base

  validates :name, :cpf, presence: true 
  
  enum jobs: ['Co-Autor','Colaborador','Consultor', 'Outro']
end
