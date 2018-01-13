require 'spec_helper'

describe Spree::Admin::SlideLocationsController do
  stub_authorization!

  let(:slide_location) { create(:slide_location) }

  context '#index' do
    it 'returns 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end