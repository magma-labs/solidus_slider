# frozen_string_literal: true

FactoryBot.define do
  factory :slide, class: 'Spree::Slide' do
    product
    name { 'Test' }
    body { 'Test' }
    link_url { '/t/test' }
    published { true }
    image { File.new(Spree::Core::Engine.root.join('lib', 'spree', 'testing_support', 'fixtures', 'blank.jpg')) }
    show_caption { true }
  end
end

FactoryBot.define do
  factory :slide_location, class: 'Spree::SlideLocation' do
    name { 'Test' }
  end
end
