class SubscribeTeamRequired < SubscribeTeam
  default_scope { where(team_type: 0)}
  
  enum professional_type: [
    'arquiteto',
    'arquiteto_paisagista',
    'engenheiro',
    'outro'
  ]  

  enum activity: [
    'arquitetura',
    'cálculo_estrutural_e_fundações',
    'interiores_com_layout_de_mobiliário',
    'instalações_prediais',
    'instalações_elétricas',
    'instalações_hidráulicas',
    'prevenção_e_combate_a_incêndio',
    'SPDA',
    'gerenciamento_integrado_de_supervisão_e_controle',
    'sonorização_ambiental_e_infraestrutura_para_multimídias',
    'condicionamente_térmico_e_conforto_ambiental',
    'comunicação_visual',
    'paisagismo'
  ]

  validates :name, :professional_type, :activity, :number_registry, :archive_path, presence: true

  mount_uploader :archive_path, ::DocumentUploader
end