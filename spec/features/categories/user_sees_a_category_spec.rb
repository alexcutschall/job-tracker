require "rails_helper"

describe "User sees one category and associated jobs" do
  describe "they link from category index" do
    it "they see a list of jobs for the category" do
      company = Company.create!(name: "Apple")
      category = Category.create!(title: "Jr Developer")

      job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

      visit categories_path
      click_link category.title

      expect(page).to have_content("#{category.title} Jobs")
      expect(page).to have_content(job1.title.capitalize)
      expect(page).to have_content(job2.title.titleize)
    end
  end
end
