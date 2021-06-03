# frozen_string_literal: true

module SolidusSlider
  class InstallNivoGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def install
      # Copy slider partial
      copy_file 'nivo_slider.html.erb', "app/views/spree/shared/_slider.html.erb"

      # Add javascripts
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require jquery.nivo.slider.pack.js\n"

      # Add stylesheets
      inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require themes/default/default\n", before: /\*\//, verbose: true
      inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require themes/pascal/pascal\n", before: /\*\//, verbose: true
      inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require themes/orman/orman\n", before: /\*\//, verbose: true
      inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require nivo-slider\n", before: /\*\//, verbose: true

      # Copy migrations
      run 'bundle exec rake railties:install:migrations FROM=solidus_slider'

      # Run migrations
      res = ask 'Would you like to run the migrations now? [Y/n]'
      if res.casecmp('y').zero?
        run 'bundle exec rake db:migrate'
      else
        puts 'Skiping rake db:migrate, don\'t forget to run it!'
      end
    end
  end
end
