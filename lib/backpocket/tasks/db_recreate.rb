namespace :db do
  desc 'Recreate the database (drop, create, migrate, seed)'
  task :recreate => %w(db:drop db:create db:migrate db:seed)
end
