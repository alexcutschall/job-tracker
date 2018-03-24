require "rails_helper"

describe "User can delete a job" do
  scenario "user deletes a job posting" do
    company = Company.create!(name: "Disney")
    job = company.jobs.create!(title: "Game Developer",
                              description: "Creating awesome games!",
                              level_of_interest: 5,
                              city: "Portland")

    visit company_path(company)
    click_button "Delete"

    expect(page).to_not have_content(job.title)
  end
end
