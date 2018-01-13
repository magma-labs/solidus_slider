require 'spec_helper'

describe Spree::Slide do
  let(:slide) { create(:slide) }
  let(:slide_location) { create(:slide_location) }
  let(:image) { File.open(File.expand_path('../../../fixtures/thinking-cat.jpg', __FILE__)) }

  context 'show_caption?' do
    it 'show caption value' do
      expect(slide.show_caption?).to be_truthy
    end
  end

  context 'slide_caption' do
    it 'show caption value' do
      expect(slide.slide_caption).to eql(slide.name)
    end
  end

  context 'slide_name' do
    it 'slide name value' do
      expect(slide.slide_name).to eql(slide.name)
    end
  end

  context 'slide_link' do
    it 'slide link value' do
      expect(slide.slide_link).to eql(slide.link_url)
    end
  end

  context 'slide_image' do
    it 'slide image value' do
      expect(slide.slide_image).to be_a(Paperclip::Attachment)
    end
  end

  context 'slide_location_ids' do
    it 'slide locations values' do
      slide.slide_locations << slide_location
      expect(slide.slide_location_ids).to eql([slide_location.id])
    end
  end
end