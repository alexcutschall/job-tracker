require "rails_helper"

describe "User can delete a contact" do
  it "deletes a contact" do
    category = Category.create!(title: "Development")
    company = Company.create!(name: "Turing")
    job = company.jobs.create!(category_id: category.id, title: "Developer", level_of_interest: 70, city: "Denver")
    contact = company.contacts.create!(full_name: "To Edit", email: "to_edit@edit.com", position: "deleter")
    visit company_path(company)

    click_link "Delete Contact"


    expect(page).to_not have_content("#{contact.full_name}'s information was deleted!'")
    expect(page).to_not have_content(contact.email)
    expect(page).to_not have_content(contact.position)
  end
end
