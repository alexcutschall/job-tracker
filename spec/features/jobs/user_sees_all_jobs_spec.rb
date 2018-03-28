require "rails_helper"

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(category_id: category.id, title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(category_id: category.id, title: "QA Analyst", level_of_interest: 70, city: "New York City")

    visit company_path(company)

    expect(page).to have_content(company.name.capitalize)
    expect(page).to have_content(job1.title.capitalize)
    expect(page).to have_content(job2.title.titleize)
  end
end
