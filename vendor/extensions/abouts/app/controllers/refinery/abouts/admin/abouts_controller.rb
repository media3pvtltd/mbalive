module Refinery
  module Abouts
    module Admin
      class AboutsController < ::Refinery::AdminController

        crudify :'refinery/abouts/about'

        private

        # Only allow a trusted parameter "white list" through.
        def about_params
          params.require(:about).permit(:title, :description)
        end
      end
    end
  end
end
