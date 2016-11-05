class SubscribeTeamOptional < SubscribeTeam


  default_scope { where(team_type: 1)}
  
  enum professional_type: [
    "arquiteto",
    "coautor",
    "consultor",
    "colaborador",
    "engenheiro"
  ]

  validates :name, :professional_type, presence: true
end