module Refinery
  module Faqs
    module Admin
      class FaqsController < ::Refinery::AdminController

        crudify :'refinery/faqs/faq',
                :title_attribute => 'question'

        private

        # Only allow a trusted parameter "white list" through.
        def faq_params
          params.require(:faq).permit(:question, :answer)
        end
      end
    end
  end
end
