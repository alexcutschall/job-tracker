require "rails_helper"

describe "User sees one company" do
  scenario "a user sees a company" do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(category_id: category.id, title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content(company.name.capitalize)
    expect(page).to have_content(job.title)
  end
end
