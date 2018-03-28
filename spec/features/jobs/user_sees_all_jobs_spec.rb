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
  scenario "a user sees all the jobs for a specific city" do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(category_id: category.id, title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(category_id: category.id, title: "QA Analyst", level_of_interest: 70, city: "New York City")

    visit "/jobs?sort=location"

    expect(job1.city).to appear_before(job2.city)
  end
  scenario "a user sees all the jobs for a interest " do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(category_id: category.id, title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(category_id: category.id, title: "QA Analyst", level_of_interest: 60, city: "New York City")

    visit "/jobs?sort=interest"

    expect(job1.title).to appear_before(job2.title)
  end
end
