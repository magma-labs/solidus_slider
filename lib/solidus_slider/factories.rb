eval(ENV.fetch('FACTORY')).define do
  factory :slide, class: 'Spree::Slide' do
    name { 'Test' }
    body { 'Test' }
    link_url { '/t/test' }
    published { true }
    image { File.new(Spree::Core::Engine.root + 'spec/fixtures/thinking-cat.jpg') }
    show_caption { true }
  end
end

eval(ENV.fetch('FACTORY')).define do
  factory :slide_location, class: 'Spree::SlideLocation' do
    name { 'Test' }
  end
end

