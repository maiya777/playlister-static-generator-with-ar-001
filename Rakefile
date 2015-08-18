task :environment do
  ENV["PLAYLISTER_ENV"] ||= "development"
  require_relative './config/environment'
end

namespace :db do
  task :migrate => :environment do
    migrate_db
  end

  task :drop => :environment do 
    drop_db
  end

  task :seed => :environment do
    LibraryParser.new('db/data').parse_and_insert_songs
  end

end

task :console => :environment do
  Pry.start
end

task :generate => :environment do
  SiteGenerator.new("_site").generate
end