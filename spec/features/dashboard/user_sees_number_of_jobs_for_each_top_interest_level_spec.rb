require "rails_helper"

describe "User sees number of jobs for each top interest level" do
  describe "user visits dashboard page" do
    it "displays the number of jobs for top interest levels" do
      category = Category.create!(title: "Tech")
      company = Company.create!(name: "Comcast")
      job1 = Job.create!(title: "Software", level_of_interest: 90, description: "Wahooo", city: "Denver", category_id: category.id, company_id: company.id)
      job2 = Job.create!(title: "Tech Support", level_of_interest: 90, description: "Blub", city: "Denver", category_id: category.id, company_id: company.id)
      job3 = Job.create!(title: "Intern", level_of_interest: 50, description: "So-So", city: "Denver", category_id: category.id, company_id: company.id)
      job4 = Job.create!(title: "Director", level_of_interest: 80, description: "Awesome Maybe", city: "Denver", category_id: category.id, company_id: company.id)
      job5 = Job.create!(title: "Manager", level_of_interest: 80, description: "No Way Jose", city: "Denver", category_id: category.id, company_id: company.id)

      visit "/dashboard"

      expect(page).to have_content("2 Job")
      expect(page).to have_content("1 Job")
    end
  end
end
