module Portal
  module CandidateArea
    class BilletsController < ApplicationController


      def generate

        @boleto = Brcobranca::Boleto::BancoBrasil.new
        @boleto.cedente = "Concurso IAB - CAUBR"
        @boleto.documento_cedente = "00480533000118"
        @boleto.sacado = "Mozzer Homologação"
        @boleto.sacado_documento = "00000000000"
        @boleto.avalista = "Concurso IAB - CAUBR"
        @boleto.avalista_documento = "0000000001"
        @boleto.valor = 1.00
        @boleto.agencia = "3475"
        @boleto.conta_corrente = "15933"
        @boleto.variacao = "19"

        # BB
        # O que diferencia um tipo de boleto de outro, dentro do Banco do Brasil é a quantidade de dígitos do convênio.
        @boleto.convenio = "2942895"

        @boleto.numero_documento = "001"
        @boleto.data_vencimento = "2016-11-01".to_date
        @boleto.data_documento = Date.today.strftime("%Y-%m-%d").to_date
        @boleto.instrucao1 = "Pagável na rede bancária até a data de vencimento."
        @boleto.instrucao4 = "NÃO RECEBER APÓS 01/11/2016"
        @boleto.sacado_endereco = "<<<Endereço IABDD CAUBR >>>"

        headers['Content-Type'] = 'application/pdf'
        send_data @boleto.to('pdf'), :filename => "boleto_concurso.pdf"
      end

    
    end
  end
end