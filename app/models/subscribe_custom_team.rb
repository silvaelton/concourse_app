class SubscribeCustomTeam < ActiveRecord::Base

  enum jobs: ['Co-Autor','Colaborador','Consultor', 'Outro']
end
