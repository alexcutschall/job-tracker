require "rails_helper"

describe "user creates a new category" do
  describe "they link from the categories index" do
    describe "they fill in a title" do
      it "creates a new category" do
        visit categories_path
        click_link "Create A New Category"

        expect(current_path).to eq(new_category_path)

        fill_in "category[title]", with: "New Category Title!"
        click_on "Submit"

        expect(current_path).to eq("/categories/#{Category.last.id}")
        expect(page).to have_content("New Category Title!")
      end
    end
    scenario "a user creates a category that already exists" do
      company = Category.create(title: "Engineer")
      visit new_category_path

      fill_in "category[title]", with: "Engineer"
      click_button "Submit"

      expect(current_path).to eq("/categories")
      expect(page).to have_content("Sorry that category name already exists!")
      expect(Category.count).to eq(1)
    end
  end
end
