require "rails_helper"

describe "User sees jobs listed by city" do
  describe "user visits the dashboard page" do
    it "shows jobs listed by city once clicked" do
      category = Category.create!(title: "Tech")
      company1 = Company.create!(name: "Comcast")
      company2 = Company.create!(name: "Health Grades")
      company3 = Company.create!(name: "Red Bull")
      company4 = Company.create!(name: "Oracle")
      job_1 = Job.create!(title: "Software", level_of_interest: 90, description: "Wahooo", city: "Denver", category_id: category.id, company_id: company1.id)
      Job.create!(title: "Tech Support", level_of_interest: 20, description: "Blub", city: "Denver", category_id: category.id, company_id: company2.id)
      Job.create!(title: "Intern", level_of_interest: 60, description: "So-So", city: "Denver", category_id: category.id, company_id: company2.id)
      Job.create!(title: "Director", level_of_interest: 80, description: "Awesome Maybe", city: "Denver", category_id: category.id, company_id: company3.id)
      job_2 = Job.create!(title: "Manager", level_of_interest: 10, description: "No Way Jose", city: "Minneapolis", category_id: category.id, company_id: company4.id)

      visit "/dashboard"
      click_on "Minneapolis"

      expect(page).to have_content(job_2.title)
      expect(page).to_not have_content(job_1.title)
    end
  end
end
