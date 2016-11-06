require 'csv'

namespace :populate do

  task :state => :environment do 

    CSV.foreach('lib/files/state.csv', :col_sep => ',') do |row|
      state = ::State.new
      state.name    = row[1]
      state.acronym = row[2]
      state.save
    end
  end

  task :participation => :environment do 

    array_project = [
      "Prancha A1 (PDF até 15mb)",
    ]

    array_juridical = [
      "1. Contrato social ou Ato constitutivo (Sociedade Simples)",
      "2. Cadastro Nacional de pessoas jurídicas no ministério da fazendo CNPJ",
      "3. Cadastro Fiscal Estadual ou Distrital",
      "4. Cadastro Fiscal Municipal ou Distrital",
      "5. Certidão negativa de débitos (CND) Fazenda Nacional",
      "6. Certidão negativa de débitos (CND) Fazenda Estadual/Municipal",
      "7. Certificado de regularidade de situação (CRF) no FGTS",
      "8. Certidão negativa de débitos trabalhistas (CNDT) na justiça do traballho",
      "9. Declaração de não utilização de trabalho escravo ou mão de obra infantil",
      "10. Comprovante de regularidade do CAU ou CREA da empresa",
      "11. Comprovante de vínculo entre o responsável técnico e a empresa detentora da inscrição"
    ]

    project = ::Participation.new({
      name: "Prancha A1 (PDF até 15mb)"
    })

    project.save

    array_juridical.each do |arr|
      obj = ::Participation.new({
        name: arr,
        participation_type: 1
      })

      obj.save
    end

  end
end