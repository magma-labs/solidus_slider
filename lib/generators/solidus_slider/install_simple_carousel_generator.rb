# frozen_string_literal: true

module SolidusSlider
  class InstallSimpleCarouselGenerator < Rails::Generators::Base
    class_option :auto_run_migrations, type: :boolean, default: false
    source_root File.expand_path('templates', __dir__)

    def install
      # Copy slider partial
      copy_file "simple_carousel_slider.html.erb", "app/views/spree/shared/_slider.html.erb"

      # Add javascripts
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require simple.carousel\n"
      append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require simple.carousel.slider\n"

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
