# Installa as Gems
bundle check || bundle install

yarn install

# Roda nosso servidor
bundle exec puma -C config/puma.rb