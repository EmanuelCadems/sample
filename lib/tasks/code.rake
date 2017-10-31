namespace :code do
  desc 'Run rake, rubocop, rails_best_practices, and brakeman'
  task check: :environment do
    system 'rake'
    system 'rubocop'
    system 'rails_best_practices .'
    system 'brakeman'
    system 'open coverage/index.html'
  end
end
