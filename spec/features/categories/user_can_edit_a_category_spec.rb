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
    scenario "a user creates a category that already exists" do
      category = Category.create(title: "Engineer")
      category2 = Category.create!(title: "Education")
      visit categories_path

      within(".category_#{category.id}") do
        click_link "Edit"
      end

      fill_in "category[title]", with: "Education"
      click_button "Submit"

      expect(current_path).to eq("/categories/#{category.id}")
      expect(page).to have_content("Sorry that category name already exists!")
    end
  end
end
