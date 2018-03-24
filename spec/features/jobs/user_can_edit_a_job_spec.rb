require "rails_helper"

describe "User edits a job" do
  scenario "a user can edit a job posting" do
    company = Company.create!(name: "Disney")
    job = company.jobs.create!(title: "Game Developer",
                              description: "Creating awesome games!",
                              level_of_interest: 5,
                              city: "Portland")

    visit edit_company_job_path(company, job)

    select('Management', :from => 'edit_job')
    fill_in "job[title]", with: "Senior Engineer"
    fill_in "job[city]", with: "Seattle"
    fill_in "job[description]", with: "Leading an engineering team"
    select 5, :from => 'Interest'

    click_button "Update Job"

    expect(page).to have_content("Senior Engineer")
    expect(page).to have_content("Seattle")
    expect(page).to have_content("Leading an engineering team")
  end
end
