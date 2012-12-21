require 'file_parsers'
include FileParsers

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  end
end
