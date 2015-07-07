# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Faqs" do
    describe "Admin" do
      describe "faqs", type: :feature do

        refinery_login_with :refinery_user


        describe "faqs list" do
          before do
            FactoryGirl.create(:faq, :question => "UniqueTitleOne")
            FactoryGirl.create(:faq, :question => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.faqs_admin_faqs_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.faqs_admin_faqs_path

            click_link "Add New Faq"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Question", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Faqs::Faq, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Faqs::Faq, :count)

              expect(page).to have_content("Question can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:faq, :question => "UniqueTitle") }

            it "should fail" do
              visit refinery.faqs_admin_faqs_path

              click_link "Add New Faq"

              fill_in "Question", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Faqs::Faq, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:faq, :question => "A question") }

          it "should succeed" do
            visit refinery.faqs_admin_faqs_path

            within ".actions" do
              click_link "Edit this faq"
            end

            fill_in "Question", :with => "A different question"
            click_button "Save"

            expect(page).to have_content("'A different question' was successfully updated.")
            expect(page).not_to have_content("A question")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:faq, :question => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.faqs_admin_faqs_path

            click_link "Remove this faq forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Faqs::Faq.count).to eq(0)
          end
        end

      end
    end
  end
end
