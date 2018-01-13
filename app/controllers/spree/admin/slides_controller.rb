module Spree
  module Admin
    class SlidesController < ResourceController
      def index
        @slides = Spree::Slide.order(:position).page(params[:page]).per(params[:per_page])
      end

      def update
        invoke_callbacks(:update, :before)
        if @object.update_attributes(permitted_resource_params)
          invoke_callbacks(:update, :after)
          handle_slide_locations(@object)
          respond_with(@object) do |format|
            format.html do
              flash[:success] = flash_message_for(@object, :successfully_updated)
              redirect_to location_after_save
            end
            format.js { render layout: false }
          end
        else
          invoke_callbacks(:update, :fails)
          respond_with(@object) do |format|
            format.html do
              flash.now[:error] = @object.errors.full_messages.join(", ")
              render_after_update_error
            end
            format.js { render layout: false }
          end
        end
      end

      private

      def location_after_save
        if @slide.created_at == @slide.updated_at
          edit_admin_slide_url(@slide)
        else
          admin_slides_url
        end
      end

      def permitted_resource_params
        params.require(:slide).permit(:name, :body, :link_url, :published, :image, :position, :product_id, :slide_location_ids)
      end

      def handle_slide_locations(object)
        slide_location_ids = permitted_resource_params[:slide_location_ids].split(',')

        slide_location_ids.each do |slide_location_id|
          object.slide_slide_locations.find_or_create_by(slide_id: object.id, slide_location_id: slide_location_id)
        end
      end
    end
  end
end
