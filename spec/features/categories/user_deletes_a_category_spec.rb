require "rails_helper"

describe "User deletes existing category" do
  describe "they link from the index page" do
    it "displays all categories without the deleted entry" do
      category = Category.create(title: "Finance")
      visit categories_path

      within(".category_#{category.id}") do
        click_link "Delete"
      end

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("#{category.title} was successfully deleted!")
      visit categories_path
      expect(page).to_not have_content(category.title)
    end
  end
end
