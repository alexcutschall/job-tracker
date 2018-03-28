require "rails_helper"

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        category = Category.create!(title: "Finance")
        job = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
    it "has many comments" do
      job = Job.new(title: "Animation Developer", level_of_interest: 5, description: "Wahooo")
      expect(job).to respond_to(:job_comments)
    end
  end

  describe "class methods" do
    describe ".top_interest_jobs" do
      it "finds the top three jobs by interest level" do
        category = Category.create!(title: "Tech")
        company = Company.create!(name: "Comcast")
        job1 = Job.create!(title: "Software", level_of_interest: 90, description: "Wahooo", city: "Denver", category_id: category.id, company_id: company.id)
        Job.create!(title: "Tech Support", level_of_interest: 20, description: "Blub", city: "Denver", category_id: category.id, company_id: company.id)
        job3 = Job.create!(title: "Intern", level_of_interest: 50, description: "So-So", city: "Denver", category_id: category.id, company_id: company.id)
        job4 = Job.create!(title: "Director", level_of_interest: 80, description: "Awesome Maybe", city: "Denver", category_id: category.id, company_id: company.id)
        Job.create!(title: "Manager", level_of_interest: 10, description: "No Way Jose", city: "Denver", category_id: category.id, company_id: company.id)

        expect(Job.top_interest_jobs.first.level_of_interest).to eq(job1.level_of_interest)
        expect(Job.top_interest_jobs[1].level_of_interest).to eq(job4.level_of_interest)
        expect(Job.top_interest_jobs[2].level_of_interest).to eq(job3.level_of_interest)
        expect(Job.top_interest_jobs.count).to eq(3)
      end
    end
    describe ".sort_by_location" do
      it "can sort jobs by location" do
        category = Category.create!(title: "Management")
        company = Company.create!(name: "Disney")
        job_1 = Job.create!(title: "Animation Developer", level_of_interest: 5, description: "Wahooo", city: "Denver", company_id: company.id, category_id: category.id)
        job_2 = Job.create!(title: "Senior Developer", level_of_interest: 1, description: "Wahooo", city: "Minneapolis", company_id: company.id, category_id: category.id)
        job_3 = Job.create!(title: "Junior Developer", level_of_interest: 5, description: "Wahooo", city: "Seattle", company_id: company.id, category_id: category.id)
        Job.sort_by_location
        
        expect(Job.sort_by_location[0].title).to eq(job_1.title)
        expect(Job.sort_by_location[1].title).to eq(job_2.title)
        expect(Job.sort_by_location[2].title).to eq(job_3.title)
      end
    end
    describe "#sort_by_interest" do
      it "can sort by interest" do
        category = Category.create!(title: "Management")
        company = Company.create!(name: "Disney")
        job_1 = Job.create!(title: "Animation Developer", level_of_interest: 90, description: "Wahooo", city: "Denver", company_id: company.id, category_id: category.id)
        job_2 = Job.create!(title: "Senior Developer", level_of_interest: 80, description: "Wahooo", city: "Minneapolis", company_id: company.id, category_id: category.id)
        job_3 = Job.create!(title: "Junior Developer", level_of_interest: 70, description: "Wahooo", city: "Seattle", company_id: company.id, category_id: category.id)
        Job.sort_by_interest

        expect(Job.sort_by_interest[0].title).to eq(job_1.title)
        expect(Job.sort_by_interest[1].title).to eq(job_2.title)
        expect(Job.sort_by_interest[2].title).to eq(job_3.title)
      end
    end
  end
end
