
FactoryGirl.define do
  factory :faq, :class => Refinery::Faqs::Faq do
    sequence(:question) { |n| "refinery#{n}" }
  end
end

