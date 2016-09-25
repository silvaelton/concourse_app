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

end