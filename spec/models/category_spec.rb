require "rails_helper"

describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new()
        expect(category).to be_invalid
      end

      it "has a unique title" do
        Category.create!(title: "Category_Name_1")
        category = Category.new(title: "Category_Name_1")
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        category = Category.new(title: "Category_Name_1")
        expect(category).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      category = Category.create!(title: "Category_Name_1")
      expect(category).to respond_to(:jobs)
    end
  end

end
