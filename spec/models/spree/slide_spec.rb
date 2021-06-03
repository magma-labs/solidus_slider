# frozen_string_literal: true

RSpec.describe Spree::Slide do
  let(:slide) { create(:slide) }
  let(:slide_location) { create(:slide_location) }

  describe 'show_caption?' do
    it 'show caption value' do
      expect(slide.show_caption?).to be(true)
    end
  end

  describe 'slide_caption' do
    it 'show caption value' do
      expect(slide.slide_caption).to eql(slide.name)
    end
  end

  describe 'slide_name' do
    it 'slide name value' do
      expect(slide.slide_name).to eql(slide.name)
    end
  end

  describe 'slide_link' do
    it 'slide link value' do
      expect(slide.slide_link).to eql(slide.link_url)
    end
  end

  describe 'slide_image' do
    it 'slide image value' do
      expect(slide.slide_image).to be_a(Paperclip::Attachment)
    end
  end

  describe 'slide_location_ids' do
    it 'slide locations values' do
      slide.slide_locations << slide_location
      expect(slide.slide_location_ids).to eql([slide_location.id])
    end
  end
end
