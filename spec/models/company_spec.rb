require "rails_helper"

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
    it "has many contacts" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:contacts)
    end
  end

  describe "class methods" do
    describe ".top_three" do
      it "finds the top three companies' average job interest level" do
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

        expect(Company.top_three.first.name).to eq(company1.name)
        expect(Company.top_three[1].name).to eq(company3.name)
        expect(Company.top_three[2].name).to eq(company2.name)
      end
    end
  end
end
