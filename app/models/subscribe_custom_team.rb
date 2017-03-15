class SubscribeCustomTeam < ActiveRecord::Base

  validates :name, :cpf, presence: true 
  
  enum job: ['Co-Autor','Colaborador','Consultor', 'Outro']
end
