require "rails_helper"

describe "User edits an existing category" do
  describe "they link from the index page" do
    describe "they they fill in an edit field and submit" do
      it "displays the updated information on the index" do
        category = Category.create!(title: "Education")
        visit categories_path
        click_link "Edit"

        expect(current_path).to eq(edit_category_path(category))

        fill_in "category[title]", with: "Finance"
        click_button "Submit"

        expect(current_path).to eq(categories_path)
        expect(page).to have_content("Finance")
        expect(page).to_not have_content("Education")
      end
    end
  end
end
