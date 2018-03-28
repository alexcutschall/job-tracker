require "rails_helper"

describe JobComment do
  describe "User creates a new comment" do
    it "appears on the Job page" do
      category = Category.create!(title: "Management")
      company = Company.create!(name: "Disney")
      job = Job.create!(title: "Animation Developer", level_of_interest: 90, description: "Wahooo", city: "Denver", company_id: company.id, category_id: category.id)

      visit job_path(job)

      within(".comment-form") do
        fill_in "job_comment[body]", with: "This is a test comment!"
      end
      click_on "Submit"

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("This is a test comment!")
    end
  end
end
