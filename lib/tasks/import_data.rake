require 'csv'

namespace :import_data do
  desc 'Import data CSV to database'

  task :import => :environment do
    csv_file = File.read(Rails.root.join('public', 'static', 'data_numbers.csv'))
    puts "Importando dados para a sua base de dados..."
    CSV.parse(csv_file, headers: true) do |row|
      Number.create(row.to_h)
    end
    puts "Importanção concluída! :)"
  end
end
