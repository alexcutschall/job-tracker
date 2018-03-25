require "rails_helper"

describe "User edits a contact" do
  describe "user can edit a contact" do
    it "should edit a contact" do
      category = Category.create!(title: "Development")
      company = Company.create!(name: "Turing")
      job = company.jobs.create!(category_id: category.id, title: "Developer", level_of_interest: 70, city: "Denver")
      visit company_jobs_path(company)

      click_link "Edit Contact"

      fill_in "contact[full_name]", with: "Jeff Casimir"
      fill_in "contact[email]", with: "jeff@hotmail.com"
      fill_in "contact[position]", with: "Executive Director"

      expect(page).to have_content("Jeff Casimir")
      expect(page).to have_content("jeff@hotmail.com")
      expect(page).to have_content("Executive Director")
    end
  end
end
