require "rails_helper"

describe "User creates a new company" do
  scenario "a user can create a new company" do
    visit new_company_path

    fill_in "company[name]", with: "ESPN"
    click_button "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}")
    expect(page).to have_content("ESPN".capitalize)
    expect(Company.count).to eq(1)
  end
  scenario "a user creates new company without title" do
    company = Company.create(name: "Disney")
    visit new_company_path

    fill_in "company[name]", with: "Disney"
    click_button "Submit"

    expect(current_path).to eq("/companies")
    expect(page).to have_content("That's already a company name!")
    expect(Company.count).to eq(1)
  end
end
