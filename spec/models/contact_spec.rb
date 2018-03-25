require "rails_helper"

describe Contact, type: :model do
  describe "validations" do
    it "is invalid without a full name" do
      company = Company.new(name: "Super Cool Store")
      contact = Contact.new(email: "hotshot@hotmail.com", position: "Senior Engineer", company_id: company.id)
      expect(contact).to be_invalid
    end
    it "is invalid without an email" do
      company = Company.new(name: "Super Cool Store")
      contact = Contact.new(full_name: "Tiffany Smith", position: "Senior Engineer", company_id: company.id)
      expect(contact).to be_invalid
    end
    it "is invalid without a position" do
      company = Company.new(name: "Super Cool Store")
      contact = Contact.new(full_name: "Tiffany Smith", email: "hotshot@hotmail.com", company_id: company.id)
      expect(contact).to be_invalid
    end
  end
  describe "relationships" do
    it {should belong_to(:company)}
  end
end
