require "rails_helper"

describe "User creates a new contact" do
  describe "a user can create a new contact" do
    it "should create a new contact" do
      category = Category.create!(title: "Development")
      company = Company.create!(name: "Turing")
      job = company.jobs.create!(category_id: category.id, title: "Developer", level_of_interest: 70, city: "Denver")
      visit company_path(company)

      click_link "Create a New Contact"

      fill_in "contact[full_name]", with: "Jeff Casimir"
      fill_in "contact[email]", with: "jeff@hotmail.com"
      fill_in "contact[position]", with: "Executive Director"

      click_button "Submit"

      expect(page).to have_content("Jeff Casimir")
      expect(page).to have_content("jeff@hotmail.com")
      expect(page).to have_content("Executive Director")
    end
  end
end
