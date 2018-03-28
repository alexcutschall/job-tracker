require "rails_helper"

describe "User edits an existing company" do
  scenario "a user can edit a company" do
    company = Company.create!(name: "ESPN")
    visit edit_company_path(company)

    fill_in "company[name]", with: "EA Sports"
    click_button "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}")
    expect(page).to have_content("EA Sports".titleize)
    expect(page).to_not have_content("ESPN".capitalize)
  end
  scenario "a user creates new company without a name" do
    company = Company.create!(name: "Disney")
    visit edit_company_path(company)

    fill_in "company[name]", with: ""
    click_button "Submit"

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("You can't leave the name blank!")
  end
end
