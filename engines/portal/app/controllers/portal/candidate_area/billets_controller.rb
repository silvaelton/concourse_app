require_dependency 'portal/application_controller'
module Portal
  module CandidateArea
    class BilletsController < ApplicationController
      before_action :subscribe_authenticate!

      def generate

        @boleto = Brcobranca::Boleto::BancoBrasil.new
        @boleto.cedente = "Concurso - Parques Central e Sul de Águas Claras - DF"
        @boleto.documento_cedente = "00480533000118"
        @boleto.sacado = current_candidate.name
        @boleto.sacado_documento = current_candidate.cpf
        @boleto.avalista = "INSTITUTO DE ARQUITETORS DO BRASIL - IABDF"
        @boleto.avalista_documento = "00480533000118"
        @boleto.valor = 300.00
        @boleto.agencia        = "3475"
        @boleto.conta_corrente = "15933"
        @boleto.carteira       = "17"
        
        # BB
        # O que diferencia um tipo de boleto de outro, dentro do Banco do Brasil é a quantidade de dígitos do convênio.
        @boleto.convenio = "2945690"

        @boleto.numero_documento = current_candidate.id
        @boleto.data_vencimento = "2017-03-11".to_date
        @boleto.data_documento = Date.today.strftime("%Y-%m-%d").to_date
        @boleto.instrucao1 = "Pagável na rede bancária até a data de vencimento."
        @boleto.instrucao4 = "NÃO RECEBER APÓS data"
        @boleto.sacado_endereco = "#{current_candidate.address} - #{current_candidate.city}"

        headers['Content-Type'] = 'application/pdf'
        send_data @boleto.to('pdf'), :filename => "boleto_concurso.pdf"
      end

    
    end
  end
end