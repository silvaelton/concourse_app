module Portal
  class SubscribeMailer < ActionMailer::Base
    default from: 'contato@iabdfconcursos.com.br'

    
    def success(candidate, project)
      @candidate = candidate
      @project   = project
      mail(to: @candidate.email, subject:"Inscrição realizada com sucesso")
    end

    def remember(candidate, project)
      @candidate = candidate
      @project   = project
      mail(to: @candidate.email, subject:"Recuperação de senha")
    end
  end
end