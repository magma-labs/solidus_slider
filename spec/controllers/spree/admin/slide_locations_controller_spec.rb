# frozen_string_literal: true

RSpec.describe Spree::Admin::SlideLocationsController do
  stub_authorization!

  let(:slide_location) { create(:slide_location) }

  describe '#index' do
    it 'returns 200' do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end
end
