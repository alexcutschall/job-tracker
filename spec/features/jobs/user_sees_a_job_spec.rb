require "rails_helper"

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(category_id: category.id, title: "Developer", level_of_interest: 70, city: "Denver")
    comment_1 = job.job_comments.create!(body: "This is a note!")
    comment_2 = job.job_comments.create!(body: "This is another note!")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content(comment_1.body)
    expect(page).to have_content(comment_2.body)
  end
end
