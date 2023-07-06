# frozen_string_literal: true

module SolidusSlider
  class InstallAnythingGenerator < Rails::Generators::Base
    class_option :auto_run_migrations, type: :boolean, default: false
    source_root File.expand_path('templates', __dir__)

    def install
      # Copy slider partial
      copy_file 'anything_slider.html.erb', "app/views/spree/shared/_slider.html.erb"

      # Add javascripts
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require js/jquery.anythingslider\n"
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require js/jquery.anythingslider.fx\n"
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require js/jquery.anythingslider.video\n"

      # Add stylesheets
      inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require css/anythingslider\n", before: %r{\*/}, verbose: true # rubocop:disable Layout/LineLength

      # Copy migrations
      run 'bin/rails railties:install:migrations FROM=solidus_slider'

      # Run migrations
      run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask('Would you like to run the migrations now? [Y/n]')) # rubocop:disable Layout/LineLength
      if run_migrations
        run 'bin/rails db:migrate'
      else
        puts 'Skipping bin/rails db:migrate, don\'t forget to run it!' # rubocop:disable Rails/Output
      end
    end
  end
end
