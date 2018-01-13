require 'spec_helper'

describe Spree::Admin::SlidesController do
  stub_authorization!

  let(:slide) { create(:slide) }
  let(:slide_location) { create(:slide_location) }
  let(:params) do
    { id: slide.id,
      slide: {
        slide_location_ids: [slide_location.id] } }
  end

  before do
    allow(subject).to receive(:permitted_resource_params).and_return(params[:slide])
  end

  context '#index' do
    it 'returns 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context '#update' do
    it 'returns true' do
      put :update, params: params
      expect(response.status).to eq(302)
      expect(slide.slide_locations).to_not be_empty
    end
  end
end