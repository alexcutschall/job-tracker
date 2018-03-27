require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)

    select(category.title, :from => 'Category')
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Submit"

    expect(current_path).to eq("/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
