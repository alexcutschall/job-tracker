require "rails_helper"

describe "User edits a job" do
  scenario "a user can edit a job posting" do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "Disney")
    job = company.jobs.create!(title: "Game Developer",
                              category_id: category.id,
                              description: "Creating awesome games!",
                              level_of_interest: 5,
                              city: "Portland")

    visit edit_company_job_path(company, job)

    select(category.title, :from => "Category")
    fill_in "job[title]", with: "Senior Engineer"
    fill_in "job[city]", with: "Seattle"
    fill_in "job[description]", with: "Leading an engineering team"
    fill_in "job[level_of_interest]", with: 80

    click_button "Submit"

    expect(page).to have_content(category.title)
    expect(page).to have_content("Senior Engineer")
    expect(page).to_not have_content("Game Developer")
    expect(page).to have_content("Seattle")
    expect(page).to have_content("Leading an engineering team")
    expect(page).to have_content(80)
  end
end
