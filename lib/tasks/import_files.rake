require 'file_parsers'
require 'biosql_web'

namespace :import do
  CDNA_OBSERVATIONS_DIRECTORY = "data/import/cdna_observations"

  desc "Import cDNA observations from #{CDNA_OBSERVATIONS_DIRECTORY}"
  task cdnaobservations: :environment do
    Dir.entries(CDNA_OBSERVATIONS_DIRECTORY).find_all { |f| f =~ /\.json/ }.each do |json_file|
      puts "Importing #{json_file}"
      begin
	FileParsers.import_cdna_json(File.open("#{CDNA_OBSERVATIONS_DIRECTORY}/#{json_file}"))
      rescue
	puts "Failed to import #{CDNA_OBSERVATIONS_DIRECTORY}/#{json_file}: #{$!}, backtrace:\n\t#{$!.backtrace.join("\n\t")}"
	exit 2
      end
    end
  end
end
