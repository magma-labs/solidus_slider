# frozen_string_literal: true

RSpec.describe Spree::Admin::SlidesController do
  stub_authorization!

  let(:slide) { create(:slide) }
  let(:slide_location) { create(:slide_location) }
  let(:params) do
    {
      id: slide.id,
      slide: {
        slide_location_ids: slide_location.id
      }
    }
  end

  before do
    allow(described_class)
      .to receive(:permitted_resource_params) { params[:slide] }
  end

  describe '#index' do
    it 'returns 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#update' do
    it 'returns true' do
      put :update, params: params

      expect(response).to have_http_status(:found)
      expect(slide.slide_locations).not_to be_empty
    end
  end
end
