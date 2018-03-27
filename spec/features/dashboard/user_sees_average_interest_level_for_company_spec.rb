require 'rails_helper'

describe 'User sees top three companies by interest level' do
  describe 'user visits dashboard page' do
    it 'shows top three company names by interest level' do
      category = Category.create!(title: "Tech")
      company1 = Company.create!(name: "Comcast")
      company2 = Company.create!(name: "Health Grades")
      company3 = Company.create!(name: "Red Bull")
      company4 = Company.create!(name: "Oracle")
      Job.create!(title: "Software", level_of_interest: 90, description: "Wahooo", city: "Denver", category_id: category.id, company_id: company1.id)
      Job.create!(title: "Tech Support", level_of_interest: 20, description: "Blub", city: "Denver", category_id: category.id, company_id: company2.id)
      Job.create!(title: "Intern", level_of_interest: 60, description: "So-So", city: "Denver", category_id: category.id, company_id: company2.id)
      Job.create!(title: "Director", level_of_interest: 80, description: "Awesome Maybe", city: "Denver", category_id: category.id, company_id: company3.id)
      Job.create!(title: "Manager", level_of_interest: 10, description: "No Way Jose", city: "Denver", category_id: category.id, company_id: company4.id)

      visit '/dashboard'

      expect(page).to have_content('90')
      expect(page).to have_content('40')
      expect(page).to have_content('80')
    end
  end
end
