module Portal
  class SubscribeMailer 
    
    def success(candidate)
      @candidate = candidate
      mail(@candidate.email, "Inscrição realizada com sucesso")
    end

  end
end