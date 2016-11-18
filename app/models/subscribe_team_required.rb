class SubscribeTeamRequired < SubscribeTeam
  default_scope { where(team_type: 0)}
  
  enum professional_type: [
    'arquiteto_urbanista',
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


  def self.activities_required current_candidate
    
    array = {}

    ::SubscribeTeamRequired.activities.each do |key,value|
      unless current_candidate.subscribe_requireds.where(activity: value).present?
        array[key] = value 
      end
    end

    array

  end

  validates :name, :professional_type, :activity, presence: true
  validates :number_registry, presence: true, if: :is_allow?
  validates :archive_path, presence: true, file_size: { less_than_or_equal_to: 3.megabytes },
                     file_content_type: { allow: ['application/pdf', 'image/jpeg', 'image/png', 'image/png'],
                                          message: "Arquivo excede 3 MB ou está em formato inválido. Formatos válidos [JPG, PNG, PDF]"}, if: :is_allow?

  
  def archive_path_url
    "http://wmasites.com.br/iabconcursos/documents/#{self.archive_path}"
  end

  private

  def is_allow?
    !self.outro? && !self.comunicação_visual?
  end
end