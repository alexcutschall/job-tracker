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

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("Developer")
  end

  scenario "a user gets error when required information is missing" do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)

    select(category.title, :from => 'Category')
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Submit"
    expect(current_path).to eq("/companies/#{company.id}/jobs/new")
    expect(page).to have_content("You are missing required information!")
    end

  scenario "a user gets error when no title is inputted" do
    category = Category.create!(title: "Management")
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)

    select(category.title, :from => 'Category')
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Submit"
    expect(current_path).to eq(new_company_job_path(company))
    expect(page).to have_content("You are missing required information!")
    end
  end
