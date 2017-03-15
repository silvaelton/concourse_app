class SubscribeCustomTeam < ActiveRecord::Base

  enum jons: ['Co-Autor','Colaborador','Consultor', 'Outro']
end
