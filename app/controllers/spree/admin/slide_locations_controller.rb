# frozen_string_literal: true

module Spree
  module Admin
    class SlideLocationsController < ResourceController
      respond_to :html, :json, :js

      def index
        @slide_locations = Spree::SlideLocation.order(:name)
      end

      def search
        @slide_locations = if params[:ids]
                             Spree::SlideLocation.where(id: params[:ids])
                           else
                             Spree::SlideLocation.ransack(params[:q]).result
                           end
      end
    end
  end
end
