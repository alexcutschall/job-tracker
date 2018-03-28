require "rails_helper"

describe "User sees all categories" do
  describe "a user visits /categories" do
    it "they see a list of all categories" do
      category1 = Category.create!(title: "Category_Name_1")
      category2 = Category.create!(title: "Category_Name_2")

      visit categories_path

      expect(page).to have_content(category1.title)
      expect(page).to have_content(category2.title)
    end
  end
end
