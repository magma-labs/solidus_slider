# frozen_string_literal: true

FactoryBot.define do
  image_path = if Spree.solidus_gem_version < Gem::Version.new('2.11')
                 File.new(Spree::Core::Engine.root.join(
                   'spec',
                   'fixtures',
                   'thinking-cat.jpg'
                 ))
               else
                 File.new(Spree::Core::Engine.root.join(
                   'lib',
                   'spree',
                   'testing_support',
                   'fixtures',
                   'blank.jpg'
                 ))
               end

  factory :slide, class: 'Spree::Slide' do
    product
    name { 'Test' }
    body { 'Test' }
    link_url { '/t/test' }
    published { true }
    image { image_path }
    show_caption { true }
  end
end

FactoryBot.define do
  factory :slide_location, class: 'Spree::SlideLocation' do
    name { 'Test' }
  end
end
