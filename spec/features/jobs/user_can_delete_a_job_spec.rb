require "rails_helper"

describe "User can delete a job" do
  scenario "user deletes a job posting" do
    company = Company.create!(name: "Disney")
    job = company.jobs.create!(title: "Game Developer",
                              description: "Creating awesome games!",
                              level_of_interest: 5,
                              city: "Portland")

    visit job_path(job)
    click_link "Delete"

    expect(page).to have_content("#{job.title} was deleted!")
  end
end
