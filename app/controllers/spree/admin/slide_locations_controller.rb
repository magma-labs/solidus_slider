module Spree
  module Admin
    class SlideLocationsController < ResourceController
      respond_to :html, :json, :js

      def index
        @slide_locations = Spree::SlideLocation.order(:name)
      end

      def search
        if params[:ids]
          @slide_locations = Spree::SlideLocation.where(id: params[:ids])
        else
          @slide_locations = Spree::SlideLocation.ransack(params[:q]).result
        end
      end
    end
  end
end
